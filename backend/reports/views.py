from django.http import HttpResponse
from django.shortcuts import render
from django.db.models import Sum
from django.utils import timezone
from orders.models import Order, OrderItem
from .models import RevenueReport, PaymentReport


def reports_index(request):
    revenue_reports = RevenueReport.objects.all().order_by("-created_at")
    payment_reports = PaymentReport.objects.all().order_by("-created_at")

    # Tổng hợp từ đơn hàng đã lưu (để hiển thị nhanh trên trang xem báo cáo)
    orders = Order.objects.prefetch_related("items", "items__menu_item")
    total_revenue = sum(float(o.total_price()) for o in orders if o.status == "done")
    total_orders = orders.count()

    return render(request, "reports/index.html", {
        "revenue_reports": revenue_reports,
        "payment_reports": payment_reports,
        "revenue_count": revenue_reports.count(),
        "payment_count": payment_reports.count(),
        "total_revenue": total_revenue,
        "total_orders": total_orders,
    })


def revenue_report(request):
    start_date = request.GET.get("start_date")
    end_date = request.GET.get("end_date")

    orders = Order.objects.all()
    if start_date and end_date:
        orders = orders.filter(created_at__range=[start_date, end_date])

    orders = orders.prefetch_related("items", "items__menu_item")
    total_revenue = sum(float(o.total_price()) for o in orders)
    total_orders = orders.count()

    top_items = (
        Order.objects.filter(items__isnull=False)
        .values("items__menu_item__name")
        .annotate(total_sold=Sum("items__quantity"))
        .order_by("-total_sold")[:5]
    )

    # Dữ liệu đã lưu trong bảng RevenueReport
    revenue_reports = RevenueReport.objects.all().order_by("-created_at")
    if start_date and end_date:
        revenue_reports = revenue_reports.filter(
            start_date__gte=start_date, end_date__lte=end_date
        )

    return render(request, "reports/revenue.html", {
        "total_revenue": total_revenue,
        "total_orders": total_orders,
        "top_items": top_items,
        "revenue_reports": revenue_reports,
        "start_date": start_date,
        "end_date": end_date,
    })


def payment_report(request):
    payment_reports = PaymentReport.objects.all().order_by("-created_at")

    total_amount = payment_reports.aggregate(s=Sum("total_amount"))["s"] or 0
    total_transactions = payment_reports.aggregate(s=Sum("total_transactions"))["s"] or 0

    return render(request, "reports/payment.html", {
        "payment_reports": payment_reports,
        "payment_summary": payment_reports,  # tương thích template cũ
        "total_amount": total_amount,
        "total_transactions": total_transactions,
    })


def _export_excel_workbook(revenue_reports, payment_reports, filename="bao_cao.xlsx"):
    """Tạo file Excel 2 sheet từ dữ liệu đã lưu."""
    import openpyxl
    from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
    from openpyxl.utils import get_column_letter

    wb = openpyxl.Workbook()

    header_font = Font(bold=True, color="FFFFFF")
    header_fill = PatternFill("solid", fgColor="2F5597")
    thin = Side(style="thin", color="B0B0B0")
    border = Border(left=thin, right=thin, top=thin, bottom=thin)
    center = Alignment(horizontal="center", vertical="center", wrap_text=True)
    left = Alignment(horizontal="left", vertical="center", wrap_text=True)
    money_fmt = '#,##0'

    # ------- Sheet 1: Báo cáo doanh thu -------
    ws1 = wb.active
    ws1.title = "Báo cáo doanh thu"
    headers1 = ["STT", "Ngày bắt đầu", "Ngày kết thúc", "Tổng doanh thu (VNĐ)", "Tổng số đơn", "Ngày tạo"]
    widths1 = [6, 16, 16, 20, 14, 20]

    ws1.append(headers1)
    for col in range(1, len(headers1) + 1):
        c = ws1.cell(row=1, column=col)
        c.font = header_font
        c.fill = header_fill
        c.alignment = center
        c.border = border
        ws1.column_dimensions[get_column_letter(col)].width = widths1[col - 1]

    reports = list(revenue_reports)
    if reports:
        for i, r in enumerate(reports, start=1):
            row = [
                i,
                r.start_date.strftime("%d/%m/%Y") if r.start_date else "",
                r.end_date.strftime("%d/%m/%Y") if r.end_date else "",
                float(r.total_revenue) if r.total_revenue is not None else 0,
                r.total_orders,
                timezone.localtime(r.created_at).strftime("%d/%m/%Y %H:%M") if r.created_at else "",
            ]
            ws1.append(row)
    else:
        # Chưa có dữ liệu đã lưu -> tổng hợp từ đơn hàng để Excel không trống
        orders = Order.objects.prefetch_related("items", "items__menu_item")
        total_rev = sum(float(o.total_price()) for o in orders)
        row = ["—", "", "", total_rev, orders.count(), timezone.localtime(timezone.now()).strftime("%d/%m/%Y %H:%M")]
        ws1.append(row)
        ws1.append(["(*) Tổng hợp từ đơn hàng đã lưu (chưa có bản ghi Báo cáo doanh thu nào trong bảng RevenueReport).", "", "", "", "", ""])
        ws1.merge_cells("A3:F3")

    for row in ws1.iter_rows(min_row=2, max_row=ws1.max_row, max_col=len(headers1)):
        for c in row:
            c.border = border
            c.alignment = center if c.column in (1, 5) else left
            if c.column == 4 and isinstance(c.value, (int, float)):
                c.number_format = money_fmt
    ws1.auto_filter.ref = f"A1:F{ws1.max_row}"
    ws1.freeze_panes = "A2"
    ws1.sheet_properties.pageSetUpPr.fitToPage = True

    # ------- Sheet 2: Báo cáo thanh toán -------
    ws2 = wb.create_sheet("Báo cáo thanh toán")
    headers2 = ["STT", "Phương thức thanh toán", "Tổng tiền (VNĐ)", "Số giao dịch", "Ngày tạo"]
    widths2 = [6, 26, 18, 16, 20]

    ws2.append(headers2)
    for col in range(1, len(headers2) + 1):
        c = ws2.cell(row=1, column=col)
        c.font = header_font
        c.fill = header_fill
        c.alignment = center
        c.border = border
        ws2.column_dimensions[get_column_letter(col)].width = widths2[col - 1]

    payments = list(payment_reports)
    if payments:
        for i, p in enumerate(payments, start=1):
            row = [
                i,
                p.get_method_display(),
                float(p.total_amount) if p.total_amount is not None else 0,
                p.total_transactions,
                timezone.localtime(p.created_at).strftime("%d/%m/%Y %H:%M") if p.created_at else "",
            ]
            ws2.append(row)
    else:
        ws2.append(["—", "Chưa có dữ liệu thanh toán đã lưu (tạo trong Admin → Báo cáo thanh toán)", 0, 0, ""])

    for row in ws2.iter_rows(min_row=2, max_row=ws2.max_row, max_col=len(headers2)):
        for c in row:
            c.border = border
            c.alignment = center if c.column in (1, 3, 4) else left
            if c.column == 3 and isinstance(c.value, (int, float)):
                c.number_format = money_fmt
    ws2.auto_filter.ref = f"A1:E{ws2.max_row}"
    ws2.freeze_panes = "A2"
    ws2.sheet_properties.pageSetUpPr.fitToPage = True

    return wb


def export_combined_excel(request):
    """Bấm 'Xem báo cáo' -> tải 1 file Excel 2 sheet (doanh thu + thanh toán)."""
    revenue_reports = RevenueReport.objects.all().order_by("-created_at")
    payment_reports = PaymentReport.objects.all().order_by("-created_at")
    wb = _export_excel_workbook(revenue_reports, payment_reports)
    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response["Content-Disposition"] = 'attachment; filename="bao_cao_doanh_thu_thanh_toan.xlsx"'
    wb.save(response)
    return response


def export_revenue_excel(request):
    """Giữ URL cũ để không vỡ link — xuất chỉ sheet doanh thu."""
    import openpyxl
    revenue_reports = RevenueReport.objects.all().order_by("-created_at")
    wb = _export_excel_workbook(revenue_reports, PaymentReport.objects.none())
    ws = wb["Báo cáo doanh thu"]
    filename = "bao_cao_doanh_thu.xlsx"
    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response["Content-Disposition"] = f'attachment; filename="{filename}"'
    wb.save(response)
    return response


def export_payment_excel(request):
    """Giữ URL cũ để không vỡ link — xuất chỉ sheet thanh toán."""
    payment_reports = PaymentReport.objects.all().order_by("-created_at")
    wb = _export_excel_workbook(RevenueReport.objects.none(), payment_reports)
    filename = "bao_cao_thanh_toan.xlsx"
    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response["Content-Disposition"] = f'attachment; filename="{filename}"'
    wb.save(response)
    return response
