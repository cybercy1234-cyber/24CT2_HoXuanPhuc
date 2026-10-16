# Food Ordering

Hệ thống đặt đồ ăn nhà hàng được xây dựng bằng Django, được tổ chức theo hai phần rõ ràng: **frontend** và **backend**.

## Cấu trúc thư mục

```
food_ordering/                 # gốc dự án
├── backend/                   # Backend (Django)
│   ├── manage.py
│   ├── config/                # Cài đặt dự án Django (settings, urls, wsgi, asgi)
│   │   ├── settings.py
│   │   ├── settings_sqlite.py
│   │   ├── urls.py
│   │   ├── wsgi.py
│   │   └── asgi.py
│   ├── customer/              # App: yêu cầu dịch vụ khách hàng
│   ├── menu/                  # App: thực đơn
│   ├── orders/                # App: đơn hàng, giỏ hàng
│   ├── reports/               # App: báo cáo doanh thu, xuất Excel
│   ├── users/                 # App: tài khoản, phân quyền
│   ├── media/                 # Ảnh tải lên (gitignored)
│   └── db.sqlite3             # CSDL SQLite (gitignored)
├── frontend/                  # Frontend (giao diện)
│   ├── templates/
│   │   ├── base.html
│   │   ├── customer/
│   │   ├── orders/
│   │   ├── reports/
│   │   └── users/
│   └── static/
│       ├── css/style.css
│       └── js/
├── data.json                  # Dữ liệu khởi tạo
├── requirements.txt           # Thư viện Python
└── README.md
```

## Cách chạy

1. Kích hoạt môi trường ảo:
   ```powershell
   venv\Scripts\Activate.ps1
   ```

2. Cài đặt thư viện:
   ```powershell
   pip install -r requirements.txt
   ```

3. Di chuyển vào thư mục backend và chạy migrations:
   ```powershell
   cd backend
   python manage.py migrate
   ```

4. Chạy server:
   ```powershell
   python manage.py runserver
   ```

Truy cập: `http://localhost:8000`

## Phân quyền người dùng (`users.User.role`)

- `customer`: khách hàng đặt món, gọi nhân viên.
- `admin`: quản trị toàn hệ thống.
- `cashier`: thu ngân, xem báo cáo doanh thu.
- `chef`: bếp, xử lý yêu cầu khách.
- `staff`: phục vụ, xử lý yêu cầu khách.

## Lưu ý

- Cài đặt mặc định sử dụng MySQL (`backend/config/settings.py`). Để dùng SQLite, cấu hình từ `settings_sqlite.py`.
- `media/`, `db.sqlite3`, `runserver.err`, `runserver.out` không được commit lên git.
