from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.utils.translation import gettext_lazy as _
from .models import User


class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2")
        help_texts = {
            "username": "Bắt buộc. Tối đa 150 ký tự. Chỉ được dùng chữ cái, chữ số và @/./+/-/_ .",
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Gán nhãn và chú thích tiếng Việt cho toàn bộ các trường (bao gồm
        # password1/password2 được khai báo trên lớp cha UserCreationForm).
        vi_labels = {
            "username": "Tên đăng nhập",
            "email": "Email",
            "password1": "Mật khẩu",
            "password2": "Xác nhận mật khẩu",
        }
        vi_help_texts = {
            "username": "Bắt buộc. Tối đa 150 ký tự. Chỉ được dùng chữ cái, chữ số và @/./+/-/_ .",
            "password1": "Mật khẩu phải có ít nhất 8 ký tự.",
            "password2": "Nhập lại cùng mật khẩu trên để xác nhận.",
        }
        for field_name, field in self.fields.items():
            if field_name in vi_labels:
                field.label = vi_labels[field_name]
            if field_name in vi_help_texts:
                field.help_text = vi_help_texts[field_name]
            # Ép thông báo lỗi bắt buộc sang tiếng Việt
            if field.required and field.error_messages.get("required") is None:
                field.error_messages["required"] = f"Vui lòng nhập {field.label.lower()}."

    def clean_email(self):
        email = self.cleaned_data.get("email")
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("Email đã tồn tại!")
        return email
