from django.urls import path
from . import views

urlpatterns = [
    path("request/", views.request_service, name="request_service"),
    path("requests/", views.customer_requests, name="customer_requests"),
    path("requests/handle/<int:request_id>/", views.handle_request, name="handle_request"),
]
