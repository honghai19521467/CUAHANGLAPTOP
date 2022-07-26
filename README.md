GIỚI THIỆU ĐỒ ÁN

LAPTOPSTORE là trang web thương mại điện tử chuyên kinh doanh về mặt hàng laptop. Trang web được xây dựng trên nền tảng ASP.Net với ngôn ngữ chính là C#. Cơ sở dữ liệu sử dụng là MySQL 8.0. Trang web tích hợp các tính năng cơ bản của 1 trang web bán hàng và 1 số tính năng nâng cao khác. Giao diện trang web được tối ưu cho trải nghiệm người dùng tốt nhất có thể ở cả những trang khách hàng sử dụng hoặc trang quan trị dành cho admin.

CÁC CHỨC NĂNG ĐÃ LÀM 

Admin:
+ Thêm / Xóa / Sửa sản phẩm
+ Xem thống kê doanh số, xuất báo cáo (PDF)
+ Quản lý hóa đơn, chuyển trạng thái đơn hàng
+ Quản lý người dùng và phân quyền.

User:
+ Tạo tài khoản, đăng nhập
+ Hiển thị thông tin, số lượng sản phẩm
+ Giỏ hàng
+ Form điền thông tin thanh toán, nhận hàng
+ Xem thông tin người dùng

Giới thiệu công nghệ mới đã sử dụng đồ án (Không nằm trong phạm vi môn học) (Nếu có):
+ Gửi email xác nhận đơn hàng đặt thành công
+ Đăng nhập bằng Google
+ Gởi mail xác thực khi đăng ký tài khoản

GIỚI THIỆU THÀNH VIÊN NHÓM 
| Họ Tên  | MSSV | FB | SĐT | Nhiệm Vụ | Hoàn Thành |
| ------- | ---- | -- | --- | -------- | -----------|
|Phan Thế Tuấn (Nhóm trưởng)	|19521081	|The Tuan Phan |+84949782585	|Xây dựng chung trang web, hỗ trợ code các chức năng |100%|
|Nguyễn Vũ Văn Đức	|19521381	|Nguyễn Vũ Văn Đức |+84766790335	|Trang đăng nhập, đăng ký, gởi mail xác thực người dùng, đăng nhập bằng google, phân quyền|100%|
|Nguyễn Thị Ái Linh	|19521757	|Nguyễn Linh |+84398667273	|Trang sản phẩm, giỏ hàng, Xem thông tin người dùng, gởi mail xác nhận đơn đặt hàng|100%|
|Nguyễn Thị Hồng Hải	|19521467	|Nguyễn Thị Hồng Hải |+84775051667	|Trang admin, báo cáo, trang chi tiết sản phẩm, phân quyền|100%|

CÀI ĐẶT CHƯƠNG TRÌNH WEB 
- Cơ sở dữ liệu sử dụng: MySQL 8.0
- Thư viện sử dụng:
+ Microsoft.AspNetCore (ver 3.1.21)
+ Microsoft.EntityFrameworkCore (ver 3.1.21)
+ Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore( ver 3.1.21)
+ Microsoft.AspNetCore.Identity.EntityFrameworkCore( ver 3.1.21)
+ Microsoft.AspNetCore.Authentication.Google(ver 3.1.21)
+ Microsoft.EntityFrameworkCore.Design (ver 3.1.21)
+ Microsoft.AspNetCore.Identity.UI( ver 3.1.22)
+ Microsoft.EntityFrameworkCore.Tools(ver 3.1.21)
+ MySQL.Data( ver 8.0.27)
+ MySql.Data.EntityFrameworkCore( ver 8.0.22)
+ Microsoft.VisualStudio.Web.CodeGeneration.Design( ver 3.1.5)
+ Chạy cmd để thêm 2 gói mailkit và mimekit:
  - dotnet add package MailKit
  - dotnet add package MimeKit

CÁC BƯỚC CHẠY FRONTEND / BACKEND

B1: Clone project về máy.

B2: Cài đặt cơ sở dữ liệu MySQl 8.0  

  + https://dev.mysql.com/downloads/mysql/
  + https://dev.mysql.com/downloads/workbench/
  
  Thông số: UserName: ‘root’; Password: ‘admin’( Hoặc vào file appsettings để đặt lại phù hợp với cấu hình)
  
B3: Chạy file LapTopMySQL_Finally.sql để tạo cơ sở dữ liệu.

B4: Kiểm tra các gói Nuget, cài đặt lại nếu không có hoặc có lỗi
    Xóa thư mục .vs 
    Note: Microsoft.AspNetCore.Identity.UI ( cập nhật lên phiên bản 3.1.22) nếu bị lỗi UI.
    
B5: Chuyển IIS express thành Test để chạy

B6: Chạy chương trình và trải nghiệm
