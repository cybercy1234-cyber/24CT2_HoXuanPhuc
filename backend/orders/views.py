from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Order, OrderItem
from menu.models import MenuItem

STAFF_ROLES = ('admin', 'cashier', 'chef', 'staff')

def get_current_order(request):
    order_id = request.session.get("order_id")
    if order_id:
        try:
            return Order.objects.get(id=order_id, status='cart')
        except Order.DoesNotExist:
            pass
    customer = request.user if request.user.is_authenticated else None
    order = Order.objects.create(customer=customer, status='cart')
    request.session["order_id"] = order.id
    return order

# ==================== KHÁCH HÀNG (không cần đăng nhập) ====================

def customer_menu(request):
    """Trang thực đơn dành cho khách hàng, công khai không cần đăng nhập."""
    items = MenuItem.objects.all()
    return render(request, "orders/customer_menu.html", {"items": items})

def cart_view(request):
    order = get_current_order(request)
    return render(request, "orders/cart.html", {"order": order})

def add_to_cart(request, item_id):
    order = get_current_order(request)
    menu_item = get_object_or_404(MenuItem, id=item_id)
    order_item, created = OrderItem.objects.get_or_create(order=order, menu_item=menu_item)
    if not created:
        order_item.quantity += 1
    order_item.save()
    return redirect("customer_menu")

def update_cart(request, item_id):
    order_item = get_object_or_404(OrderItem, id=item_id)
    if request.method == "POST":
        quantity = int(request.POST.get("quantity", 1))
        if quantity <= 0:
            order_item.delete()
        else:
            order_item.quantity = quantity
            order_item.save()
    return redirect("cart")

def submit_order(request):
    order = get_current_order(request)
    if request.method == "POST":
        order.table_number = request.POST.get("table_number", order.table_number)
    order.status = "pending"
    order.save()
    request.session.pop("order_id", None)
    return redirect("order_status", order_id=order.id)

def order_status(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    return render(request, "orders/status.html", {"order": order})

# ==================== NHÂN VIÊN (cần đăng nhập, vai trò staff) ====================

@login_required
def staff_menu(request):
    """Trang thực đơn dành cho nhân viên, yêu cầu đăng nhập và vai trò staff."""
    if request.user.role not in STAFF_ROLES:
        return redirect("customer_menu")
    items = MenuItem.objects.all()
    return render(request, "orders/staff_menu.html", {"items": items})

@login_required
def confirm_order(request, order_id):
    """Nhân viên xác nhận đơn hàng của khách hàng (pending → confirmed)."""
    if request.user.role not in STAFF_ROLES:
        return redirect("customer_menu")
    order = get_object_or_404(Order, id=order_id)
    if order.status != 'pending':
        return redirect("order_status", order_id=order.id)
    order.status = 'confirmed'
    order.save()
    return redirect("order_status", order_id=order.id)

@login_required
def qr_payment(request):
    """Trang hiển thị QR thanh toán (chỉ nhân viên/quản trị xem)."""
    if request.user.role not in STAFF_ROLES:
        return redirect("customer_menu")
    return render(request, "orders/qr_payment.html")
