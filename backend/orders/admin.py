from django.contrib import admin
from .models import Table, Order, OrderItem


@admin.register(Table)
class TableAdmin(admin.ModelAdmin):
    list_display = ('id', 'number', 'name', 'is_active')
    list_filter = ('is_active',)
    search_fields = ('number', 'name')


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 1


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'customer', 'table', 'table_number', 'status', 'is_paid', 'created_at')
    list_filter = ('status', 'is_paid', 'created_at')
    search_fields = ('table_number', 'customer__username')
    inlines = [OrderItemInline]
    list_editable = ('status', 'is_paid')


@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ('id', 'order', 'menu_item', 'quantity', 'unit_price')
    list_filter = ('order',)
    search_fields = ('menu_item__name',)
