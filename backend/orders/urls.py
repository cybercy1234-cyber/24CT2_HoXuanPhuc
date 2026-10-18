from django.urls import path
from . import views

urlpatterns = [
    # Khách hàng (công khai, không cần đăng nhập)
    path("menu/", views.customer_menu, name="customer_menu"),
    path("cart/", views.cart_view, name="cart"),
    path("cart/add/<int:item_id>/", views.add_to_cart, name="add_to_cart"),
    path("cart/update/<int:item_id>/", views.update_cart, name="update_cart"),
    path("cart/submit/", views.submit_order, name="submit_order"),
    path("order/<int:order_id>/status/", views.order_status, name="order_status"),
    path("order/<int:order_id>/confirm/", views.confirm_order, name="confirm_order"),

    # Nhân viên (yêu cầu đăng nhập)
    path("staff/menu/", views.staff_menu, name="staff_menu"),
    path("qr-payment/", views.qr_payment, name="qr_payment"),
]
