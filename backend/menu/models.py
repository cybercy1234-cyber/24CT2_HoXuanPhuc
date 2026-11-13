from django.db import models

class MenuItem(models.Model):
    name = models.CharField(max_length=100, verbose_name="Tên món")
    description = models.TextField(blank=True, verbose_name="Mô tả")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Giá")
    image = models.ImageField(upload_to='menu_images/', blank=True, null=True, verbose_name="Ảnh món")

    class Meta:
        verbose_name = "Món ăn"
        verbose_name_plural = "Danh sách món ăn"

    def __str__(self):
        return self.name

