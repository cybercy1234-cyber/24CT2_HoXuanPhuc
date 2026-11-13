from django.contrib import admin
from .models import CustomerRequest


@admin.register(CustomerRequest)
class CustomerRequestAdmin(admin.ModelAdmin):
    list_display = ('id', 'table_number', 'request_type', 'customer', 'is_handled', 'created_at')
    list_filter = ('is_handled', 'request_type', 'created_at')
    search_fields = ('table_number',)
    list_editable = ('is_handled',)
