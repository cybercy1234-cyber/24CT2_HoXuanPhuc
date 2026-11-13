from django.db import models
from django.conf import settings

class CustomerRequest(models.Model):
    REQUEST_CHOICES = [
        ('ice', 'Thêm đá'),
        ('towel', 'Khăn lạnh'),
        ('chopsticks', 'Đổi đũa'),
        ('payment', 'Gọi tính tiền'),
        ('other', 'Khác'),
    ]
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True, verbose_name="Khách hàng")
    table = models.ForeignKey('orders.Table', on_delete=models.SET_NULL, blank=True, null=True, related_name='service_requests', verbose_name="Bàn")
    table_number = models.CharField(max_length=10, verbose_name="Số bàn")
    request_type = models.CharField(max_length=20, choices=REQUEST_CHOICES, verbose_name="Loại yêu cầu")
    note = models.TextField(blank=True, null=True, verbose_name="Ghi chú")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Thời gian tạo")
    is_handled = models.BooleanField(default=False, verbose_name="Đã xử lý")

    class Meta:
        verbose_name = "Yêu cầu khách hàng"
        verbose_name_plural = "Danh sách yêu cầu khách hàng"

    def __str__(self):
        return f"Bàn {self.table_number} - {self.get_request_type_display()}"

    def save(self, *args, **kwargs):
        if self.table_number and not self.table_id:
            from orders.models import Table
            table, _ = Table.objects.get_or_create(number=self.table_number)
            self.table = table
        elif self.table and not self.table_number:
            self.table_number = self.table.number
        super().save(*args, **kwargs)
