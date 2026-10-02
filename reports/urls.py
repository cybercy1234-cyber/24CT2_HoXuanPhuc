from django.urls import path
from . import views

urlpatterns = [
    path("revenue/", views.revenue_report, name="revenue_report"),
    path("revenue/export/", views.export_revenue_excel, name="export_revenue_excel"),
    path("payment/export/", views.export_payment_excel, name="export_payment_excel"),
]
