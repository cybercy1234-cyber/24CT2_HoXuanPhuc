from django.contrib import admin
from django.http import HttpResponse
from .models import RevenueReport, PaymentReport
from .views import _export_excel_workbook


def export_selected_revenue(modeladmin, request, queryset):
    wb = _export_excel_workbook(queryset.order_by("-created_at"), PaymentReport.objects.none())
    response = HttpResponse(content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response["Content-Disposition"] = 'attachment; filename="bao_cao_doanh_thu_da_chon.xlsx"'
    wb.save(response)
    return response


export_selected_revenue.short_description = "Xuất Excel (báo cáo doanh thu đã chọn)"


def export_selected_payment(modeladmin, request, queryset):
    wb = _export_excel_workbook(RevenueReport.objects.none(), queryset.order_by("-created_at"))
    response = HttpResponse(content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response["Content-Disposition"] = 'attachment; filename="bao_cao_thanh_toan_da_chon.xlsx"'
    wb.save(response)
    return response


export_selected_payment.short_description = "Xuất Excel (báo cáo thanh toán đã chọn)"


@admin.register(RevenueReport)
class RevenueReportAdmin(admin.ModelAdmin):
    list_display = ('id', 'start_date', 'end_date', 'total_revenue', 'total_orders', 'created_at')
    list_filter = ('created_at',)
    search_fields = ()
    actions = [export_selected_revenue]


@admin.register(PaymentReport)
class PaymentReportAdmin(admin.ModelAdmin):
    list_display = ('id', 'method', 'total_amount', 'total_transactions', 'created_at')
    list_filter = ('method', 'created_at')
    search_fields = ()
    actions = [export_selected_payment]
