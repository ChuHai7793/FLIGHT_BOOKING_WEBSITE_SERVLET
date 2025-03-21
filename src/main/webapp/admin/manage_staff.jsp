<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Căn giữa theo chiều dọc */
        .table td, .table th {
            vertical-align: middle;
        }
    </style>

</head>
<body>
<!-- Main Content -->
<div class="container mt-4">
    <div class="row">
        <!-- Menu tài khoản: 25% -->
        <div class="col-md-3">
            <%@ include file="/WEB-INF/view/common/account_menu.jsp" %>
        </div>

        <!-- Nội dung chính: 75% -->
        <div class="col-md-9 border p-3">
            <div class="row">
                <div class="col-md-12 right-section border p-3">
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                        <tr>
                            <th scope="col" class="text-center">Mã nhân viên</th>
                            <th scope="col" class="text-center">Tên</th>
                            <th scope="col" class="text-center">Địa chỉ</th>
                            <th scope="col" class="text-center">Giới tính</th>
                            <th scope="col" class="text-center">Ngày sinh</th>
                            <th scope="col" class="text-center">Email</th>
                            <th scope="col" class="text-center">Phone</th>
                            <th scope="col" class="text-center">Sửa</th>
                            <th scope="col" class="text-center">Xóa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="staff" items="${staffs}">
                            <tr>
                                <td class="text-center">${staff.userId}</td>
                                <td class="text-center">${staff.fullName}</td>
                                <td class="text-center">${staff.address}</td>
                                <td class="text-center">${staff.gender}</td>
                                <td class="text-center">${staff.birthDate}</td>
                                <td class="text-center">${staff.email}</td>
                                <td class="text-center">${staff.phone}</td>
                                <td class="text-center">
                                    <a href="../admin?action=edit&staffId=${staff.userId}">Chỉnh sửa</a>
                                </td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="deleteStaff(${staff.userId})">
                                        Xóa
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Modal chỉnh sửa thông tin -->
<div class="modal fade" id="editInfo" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa thông tin</h5>
                <button type="button" class="btn-close" onclick="hideEditForm()" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../admin" method="post" accept-charset="UTF-8"> <!-- Hiện tại đang ở /customer nên action="" -->
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="staffId" value=${chosen_staff.userId}>
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${chosen_staff.fullName}">
                    </div>
                    <div class="mb-3">
                        <label for="birth_date" class="form-label">Ngày sinh:</label>
                        <input type="date" class="form-control" id="birth_date" name="birth_date" value="${chosen_staff.birthDate}">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address" value="${chosen_staff.address}">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="${chosen_staff.email}">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Điện thoại:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" value="${chosen_staff.phone}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="hideEditForm()">Hủy</button>
                        <input type="submit" class="btn btn-primary" value="Lưu thay đổi">
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
<script>

    window.onload = function() {
        var chosen_staff = "<%= request.getAttribute("chosen_staff") %>";
        if (chosen_staff && chosen_staff !== "null") {
            showEditForm();
        }
    };
    function showEditForm() {
        var modal = new bootstrap.Modal(document.getElementById('editInfo'));
        modal.show();
    }
    function deleteStaff(staffId) {
        if (confirm("Bạn có chắc chắn muốn xóa nhân viên này không?")) {
            window.location.href = "../admin?action=delete&staffId=" + staffId;
        }
    }
    function hideEditForm() {
        var modal = bootstrap.Modal.getInstance(document.getElementById('editInfo'));
        modal.hide();
    }
</script>
</html>