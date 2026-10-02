import pandas as pd
from django.http import HttpResponse
from django.shortcuts import render
from django.db.models import Sum, Count
from orders.models import Order, OrderItem

def revenue_report(request):
    start_date = request.GET.get("start_date")
    end_date = request.GET.get("end_date")

    orders = Order.objects.all()
    if start_date and end_date:
        orders = orders.filter(created_at__range=[start_date, end_date])

    total_revenue = sum(order.total_price() for order in orders)
    total_orders = orders.count()

    top_items = OrderItem.objects.values("menu_item__name").annotate(
        total_sold=Sum("quantity")
    ).order_by("-total_sold")[:5]

    return render(request, "reports/revenue.html", {
        "total_revenue": total_revenue,
        "total_orders": total_orders,
        "top_items": top_items,
    })

def export_revenue_excel(request):
    orders = Order.objects.all()
    data = []
    for order in orders:
        data.append({
            "Order ID": order.id,
            "Customer": order.customer.username,
            "Status": order.status,
            "Total Price": order.total_price(),
            "Created At": order.created_at,
        })
    df = pd.DataFrame(data)

    response = HttpResponse(content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response["Content-Disposition"] = 'attachment; filename="revenue_report.xlsx"'
    df.to_excel(response, index=False)
    return response

def export_payment_excel(request):
    orders = Order.objects.all()
    payment_summary = orders.values("payment_method").annotate(
        total_amount=Sum("items__menu_item__price"),
        total_transactions=Count("id")
    )
    df = pd.DataFrame(payment_summary)

    response = HttpResponse(content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response["Content-Disposition"] = 'attachment; filename="payment_report.xlsx"'
    df.to_excel(response, index=False)
    return response
