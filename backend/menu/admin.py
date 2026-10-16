from django.contrib import admin
from django.utils.html import format_html
from .models import MenuItem

@admin.register(MenuItem)
class MenuItemAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'image_preview')
    fields = ('name', 'description', 'price', 'image')

    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="height:50px;" />', obj.image.url)
        return "Chưa có ảnh"
    image_preview.short_description = "Ảnh"
