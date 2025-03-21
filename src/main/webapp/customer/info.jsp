<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<div class="container mt-3">
    <div class="row">
        <!-- Menu tài khoản 25% -->
        <div class="col-md-3">
            <%@ include file="/WEB-INF/view/common/account_menu.jsp" %>
        </div>

        <!-- Nội dung chính 75% -->
        <div class="col-md-9 border p-3">
            <c:if test="${not empty user}">
                <h5>Thông tin cá nhân</h5>
                <hr>
                <p><strong>Tên:</strong> ${user.fullName}</p>
                <p><strong>Ngày sinh:</strong> ${user.birthDate}</p>
                <p><strong>Giới tính:</strong> ${user.gender eq 'male' ? 'Nam' : 'Nữ'}</p>
                <p><strong>Địa chỉ:</strong> ${user.address}</p>
                <p><strong>Email:</strong> ${user.email}</p>
                <p><strong>Điện thoại:</strong> ${user.phone}</p>
                <p><strong>CCCD:</strong> ${user.nationalId}</p>
                <p><strong>Quốc tịch:</strong> ${user.nationality}</p>
                <button type="button" class="btn btn-primary" onclick="showEditForm()">Chỉnh sửa</button>
            </c:if>
            <c:if test="${empty user}">
                <p>Không có thông tin người dùng!</p>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/common/footer.jsp" %>

<!-- Modal chỉnh sửa thông tin -->
<div class="modal fade" id="editInfo" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa thông tin</h5>
                <button type="button" class="btn-close" onclick="hideEditForm()" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../customer" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="userId" value="${user.userId}">

                    <div class="mb-3">
                        <label for="name" class="form-label">Tên:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${user.fullName}" required>
                    </div>

                    <div class="mb-3">
                        <label for="birth_date" class="form-label">Ngày sinh:</label>
                        <input type="date" class="form-control" id="birth_date" name="birth_date" value="${user.birthDate}" required>
                    </div>

                    <div class="mb-3">
                        <label for="gender" class="form-label">Giới tính:</label>
                        <select name="gender" id="gender" class="form-control">
                            <option value="male" ${user.gender eq 'male' ? 'selected' : ''}>Nam</option>
                            <option value="female" ${user.gender eq 'female' ? 'selected' : ''}>Nữ</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Điện thoại:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" value="${user.phone}" required>
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showEditForm() {
        var modal = new bootstrap.Modal(document.getElementById('editInfo'));
        modal.show();
    }

    function hideEditForm() {
        var modal = bootstrap.Modal.getInstance(document.getElementById('editInfo'));
        modal.hide();
    }
</script>
