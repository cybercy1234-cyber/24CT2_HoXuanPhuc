from django.db import models
from django.conf import settings
from menu.models import MenuItem

class Order(models.Model):
    STATUS_CHOICES = [
        ('cart', 'Giỏ hàng'),
        ('pending', 'Chờ bếp xác nhận'),
        ('cooking', 'Đang chế biến'),
        ('done', 'Đã xong'),
        ('served', 'Lên món'),
    ]
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True)
    table_number = models.CharField(max_length=10, blank=True, default='', verbose_name='Số bàn')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    created_at = models.DateTimeField(auto_now_add=True)

    def total_price(self):
        return sum(item.total_price() for item in self.items.all())

    def __str__(self):
        return f"Order #{self.id} - {self.customer}"

class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name="items", on_delete=models.CASCADE)
    menu_item = models.ForeignKey(MenuItem, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    note = models.TextField(blank=True, null=True)

    def total_price(self):
        return self.menu_item.price * self.quantity

    def __str__(self):
        return f"{self.quantity} x {self.menu_item.name}"
