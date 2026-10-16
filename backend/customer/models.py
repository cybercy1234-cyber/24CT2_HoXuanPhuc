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
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True)
    table_number = models.CharField(max_length=10)
    request_type = models.CharField(max_length=20, choices=REQUEST_CHOICES)
    note = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    is_handled = models.BooleanField(default=False)

    def __str__(self):
        return f"Bàn {self.table_number} - {self.get_request_type_display()}"
