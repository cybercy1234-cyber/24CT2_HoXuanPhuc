from django.urls import path
from . import views

urlpatterns = [
    path("menu/", views.menu_page, name="menu_page"),
    path("cart/", views.cart_view, name="cart"),
    path("cart/add/<int:item_id>/", views.add_to_cart, name="add_to_cart"),
    path("cart/update/<int:item_id>/", views.update_cart, name="update_cart"),
    path("cart/submit/", views.submit_order, name="submit_order"),
    path("order/<int:order_id>/status/", views.order_status, name="order_status"),
]
