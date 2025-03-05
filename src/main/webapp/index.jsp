<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt vé - MyWebsite</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- Header với Navbar -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">2HAI AIRLINE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Giới Thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Dịch Vụ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên Hệ</a>
                    </li>
                </ul>
                <div class="d-flex gap-2">
                    <button class="btn btn-outline-primary btn-register">Đăng ký</button>
                    <button class="btn btn-primary btn-login">Đăng nhập</button>
                </div>
            </div>
        </div>
    </nav>
</header>

<!-- Form đặt vé -->
<div class="container mt-5">
    <form action="">
        <fieldset class="border p-4 rounded">
            <legend class="float-none w-auto px-2">Đặt vé</legend>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="name" class="form-label">Điểm đi</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Nhập điểm đi">
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Điểm đến</label>
                    <input type="text" class="form-control" id="email" name="destination" placeholder="Nhập điểm đến">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="leaving-date" class="form-label">Ngày đi</label>
                    <input type="date" class="form-control" id="leaving-date" name="leaving-date">
                </div>
                <div class="col-md-6">
                    <label for="return-date" class="form-label">Ngày về</label>
                    <input type="date" class="form-control" id="return-date" name="return-date">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="adult_num" class="form-label">Người lớn</label>
                    <input type="number" class="form-control" id="adult_num" name="adult_num" min="0" placeholder="0">
                </div>
                <div class="col-md-4">
                    <label for="kid_num" class="form-label">Trẻ em</label>
                    <input type="number" class="form-control" id="kid_num" name="kid_num" min="0" placeholder="0">
                </div>
                <div class="col-md-4">
                    <label for="baby_num" class="form-label">Em bé</label>
                    <input type="number" class="form-control" id="baby_num" name="baby_num" min="0" placeholder="0">
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-primary">Tìm vé</button>
            </div>
        </fieldset>
    </form>
</div>
<a href="customer/register.jsp"> chuyển hướng register</a><br>
<a href="customer/login.jsp"> chuyển hướng login</a><br>
<a href="customer/info.jsp"> chuyển hướng info</a><br>
<a href="customer/payment.jsp"> chuyển hướng payment</a><br>
<a href="customer/transaction_history.jsp"> chuyển hướng history</a><br>
<a href="customer/change_password.jsp"> chuyển hướng change pw</a><br>
<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>



