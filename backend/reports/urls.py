from django.urls import path
from . import views

urlpatterns = [
    path("", views.reports_index, name="reports_index"),
    path("revenue/", views.revenue_report, name="revenue_report"),
    path("payment/", views.payment_report, name="payment_report"),
    path("export/", views.export_combined_excel, name="export_combined_excel"),
    path("revenue/export/", views.export_revenue_excel, name="export_revenue_excel"),
    path("payment/export/", views.export_payment_excel, name="export_payment_excel"),
]
