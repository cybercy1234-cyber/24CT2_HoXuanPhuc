from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import CustomerRequest

STAFF_ROLES = ('admin', 'cashier', 'chef', 'staff')

def request_service(request):
    if request.method == "POST":
        table_number = request.POST.get("table_number")
        request_type = request.POST.get("request_type")
        note = request.POST.get("note", "")
        CustomerRequest.objects.create(
            customer=request.user if request.user.is_authenticated else None,
            table_number=table_number,
            request_type=request_type,
            note=note
        )
        messages.success(request, "Đã gửi yêu cầu, nhân viên sẽ đến ngay!")
        return redirect("request_service")
    return render(request, "customer/request.html")

@login_required
def customer_requests(request):
    if request.user.role not in STAFF_ROLES:
        return redirect("menu_page")
    requests = CustomerRequest.objects.filter(is_handled=False)
    return render(request, "customer/list.html", {"requests": requests})

@login_required
def handle_request(request, request_id):
    if request.user.role not in STAFF_ROLES:
        return redirect("menu_page")
    req = CustomerRequest.objects.get(id=request_id)
    req.is_handled = True
    req.save()
    return redirect("customer_requests")

