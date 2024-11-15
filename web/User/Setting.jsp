

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Cài đặt mật khẩu | GROUP1</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="doc/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body class="app sidebar-mini rtl">
        <style>
            .input-group {
                width: 50%; /* Đặt chiều rộng của input group thành 50% */

            }

            .input-group-text {
                cursor: pointer; /* Thêm con trỏ khi di chuột lên icon */
            }

            /* Ẩn icon khi không cần thiết */
            .toggle-password {
                display: flex;
                align-items: center;
            }

            /* Tùy chỉnh icon mắt */
            .toggle-password i {
                font-size: 1.2rem; /* Kích thước icon */
            }

        </style>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <!-- Include menu -->
        <jsp:include page="/menu.jsp" />


        <main class="app-content">

            <div class="row">
                <div class="col-md-12">

                    <div class="tile">

                        <h3 class="tile-title">Cài đặt mật khẩu</h3>
                        <div class="tile-body">
                            <form class="row" action="settingController" method="POST">
                                <div class="form-group col-md-12">
                                    <c:if test="${not empty errorMessage}">
                                        <p style="color:red">${errorMessage}</p>
                                    </c:if>
                                    <label class="control-label">Mật khẩu cũ</label>
                                    <div class="input-group">
                                        <input class="form-control" id="oldPassword" type="password" name="oldPassword" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text toggle-password" id="toggleOldPassword">
                                                <i class="fas fa-eye"></i>
                                            </span>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Mật khẩu mới</label>
                                    <div class="input-group">
                                        <input class="form-control" id="newPassword" type="password" name="newPassword" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text toggle-password" id="toggleNewPassword">
                                                <i class="fas fa-eye"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <p id="passwordError" style="color:red; display:none;">Mật khẩu mới phải có ít nhất 6 ký tự.</p>
                                    <p id="samePasswordError" style="color:red; display:none;">Mật khẩu mới phải khác mật khẩu cũ.</p>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Nhập lại mật khẩu mới</label>
                                    <div class="input-group">
                                        <input class="form-control" id="confirmNewPassword" type="password" name="confirmNewPassword" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text toggle-password" id="toggleConfirmNewPassword">
                                                <i class="fas fa-eye"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <p id="confirmPasswordError" style="color:red; display:none;">Mật khẩu nhập lại không khớp.</p>
                                </div>

                                <div class="form-group col-md-12">
                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                    <a class="btn btn-cancel" href="homepage">Hủy bỏ</a>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>



    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <script>
        document.querySelectorAll('.toggle-password').forEach(item => {
            item.addEventListener('click', function () {
                const input = this.parentElement.previousElementSibling;
                const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
                input.setAttribute('type', type);
                this.querySelector('i').classList.toggle('fa-eye-slash'); // Đổi icon
            });
        });

        document.querySelector('form').addEventListener('submit', function (event) {
            // Lấy giá trị của các mật khẩu
            const oldPassword = document.getElementById('oldPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmNewPassword = document.getElementById('confirmNewPassword').value;

            // Lấy các phần tử hiển thị lỗi
            const passwordError = document.getElementById('passwordError');
            const confirmPasswordError = document.getElementById('confirmPasswordError');
            const samePasswordError = document.getElementById('samePasswordError');

            // Kiểm tra độ dài mật khẩu mới
            if (newPassword.length < 6) {
                event.preventDefault(); // Ngăn gửi form
                passwordError.style.display = 'block'; // Hiển thị thông báo lỗi
            } else {
                passwordError.style.display = 'none';
            }

            // Kiểm tra mật khẩu nhập lại có khớp không
            if (newPassword !== confirmNewPassword) {
                event.preventDefault();
                confirmPasswordError.style.display = 'block';
            } else {
                confirmPasswordError.style.display = 'none';
            }

            // Kiểm tra mật khẩu mới có khác mật khẩu cũ không
            if (newPassword === oldPassword) {
                event.preventDefault();
                samePasswordError.style.display = 'block';
            } else {
                samePasswordError.style.display = 'none';
            }
        });



    </script>



</body>

</html>