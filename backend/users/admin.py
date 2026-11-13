from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User

admin.site.site_header = "Quản trị Food Ordering"
admin.site.site_title = "Quản trị Food Ordering"


@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = ("username", "email", "role", "is_staff", "is_active")
    list_filter = ("role", "is_staff", "is_active")
    search_fields = ("username", "email")
    fieldsets = UserAdmin.fieldsets + (
        ("Vai trò hệ thống", {"fields": ("role",)}),
    )
    add_fieldsets = UserAdmin.add_fieldsets + (
        ("Vai trò hệ thống", {"fields": ("role",)}),
    )
