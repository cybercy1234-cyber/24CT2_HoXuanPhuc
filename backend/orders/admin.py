from django.contrib import admin
from .models import Order, OrderItem


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 1


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'customer', 'table_number', 'status', 'created_at')
    list_filter = ('status', 'created_at')
    search_fields = ('table_number',)
    inlines = [OrderItemInline]
    list_editable = ('status',)


@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ('id', 'order', 'menu_item', 'quantity')
    list_filter = ('order',)
    search_fields = ('menu_item__name',)
