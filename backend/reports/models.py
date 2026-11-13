from django.db import models
from orders.models import Order

class RevenueReport(models.Model):
    start_date = models.DateField(verbose_name="Ngày bắt đầu")
    end_date = models.DateField(verbose_name="Ngày kết thúc")
    total_revenue = models.DecimalField(max_digits=12, decimal_places=2, verbose_name="Tổng doanh thu")
    total_orders = models.IntegerField(verbose_name="Tổng số đơn")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Thời gian tạo")

    class Meta:
        verbose_name = "Báo cáo doanh thu"
        verbose_name_plural = "Danh sách báo cáo doanh thu"

class PaymentReport(models.Model):
    PAYMENT_CHOICES = [
        ('cash', 'Tiền mặt'),
        ('transfer', 'Chuyển khoản'),
        ('wallet', 'Ví điện tử'),
    ]
    method = models.CharField(max_length=20, choices=PAYMENT_CHOICES, verbose_name="Phương thức thanh toán")
    total_amount = models.DecimalField(max_digits=12, decimal_places=2, verbose_name="Tổng tiền")
    total_transactions = models.IntegerField(verbose_name="Số giao dịch")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Thời gian tạo")

    class Meta:
        verbose_name = "Báo cáo thanh toán"
        verbose_name_plural = "Danh sách báo cáo thanh toán"

