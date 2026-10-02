from django.db import models
from orders.models import Order

class RevenueReport(models.Model):
    start_date = models.DateField()
    end_date = models.DateField()
    total_revenue = models.DecimalField(max_digits=12, decimal_places=2)
    total_orders = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

class PaymentReport(models.Model):
    PAYMENT_CHOICES = [
        ('cash', 'Tiền mặt'),
        ('transfer', 'Chuyển khoản'),
        ('wallet', 'Ví điện tử'),
    ]
    method = models.CharField(max_length=20, choices=PAYMENT_CHOICES)
    total_amount = models.DecimalField(max_digits=12, decimal_places=2)
    total_transactions = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

