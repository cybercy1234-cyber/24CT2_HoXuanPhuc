from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    ROLE_CHOICES = [
        ('customer', 'Khách hàng'),
        ('admin', 'Admin'),
        ('cashier', 'Thu ngân'),
        ('chef', 'Bếp'),
        ('staff', 'Phục vụ'),
    ]
    role = models.CharField(max_length=20, choices=ROLE_CHOICES, default='customer', verbose_name="Vai trò")

    class Meta:
        verbose_name = "Người dùng"
        verbose_name_plural = "Danh sách người dùng"

    def __str__(self):
        return f"{self.username} ({self.role})"
