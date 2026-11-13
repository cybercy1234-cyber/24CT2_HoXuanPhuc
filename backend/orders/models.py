from django.db import models
from django.conf import settings
from menu.models import MenuItem

class Order(models.Model):
    STATUS_CHOICES = [
        ('cart', 'Giỏ hàng'),
        ('pending', 'Chờ xác nhận'),
        ('confirmed', 'Đã xác nhận'),
        ('cooking', 'Đang chế biến'),
        ('done', 'Đã xong'),
        ('served', 'Lên món'),
    ]
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True, verbose_name="Khách hàng")
    table_number = models.CharField(max_length=10, blank=True, default='', verbose_name='Số bàn')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name="Trạng thái")
    is_paid = models.BooleanField(default=False, verbose_name="Đã thanh toán")
    payment_notified = models.BooleanField(default=False, verbose_name="Đã hiện thông báo thanh toán")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Thời gian tạo")

    class Meta:
        verbose_name = "Đơn hàng"
        verbose_name_plural = "Danh sách đơn hàng"

    def total_price(self):
        return sum(item.total_price() for item in self.items.all())

    def __str__(self):
        return f"Order #{self.id} - {self.customer}"

class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name="items", on_delete=models.CASCADE, verbose_name="Đơn hàng")
    menu_item = models.ForeignKey(MenuItem, on_delete=models.CASCADE, verbose_name="Món ăn")
    quantity = models.PositiveIntegerField(default=1, verbose_name="Số lượng")
    note = models.TextField(blank=True, null=True, verbose_name="Ghi chú")

    class Meta:
        verbose_name = "Chi tiết đơn hàng"
        verbose_name_plural = "Danh sách chi tiết đơn hàng"

    def total_price(self):
        return self.menu_item.price * self.quantity

    def __str__(self):
        return f"{self.quantity} x {self.menu_item.name}"
