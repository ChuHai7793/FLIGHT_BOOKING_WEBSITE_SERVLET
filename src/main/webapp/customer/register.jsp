<%--
  Created by IntelliJ IDEA.
  User: haich_ahutcq2
  Date: 05/03/2025
  Time: 09:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Đăng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }

        .form-container {
            width: 350px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #007bff;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            height: 60px;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đăng Ký</h2>
    <form action="#" method="POST">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirm-password">Xác nhận mật khẩu:</label>
        <input type="password" id="confirm-password" name="confirm-password" required>

        <label for="phone">Điện thoại:</label>
        <input type="tel" id="phone" name="phone" required>

        <label for="fullname">Họ và Tên:</label>
        <input type="text" id="fullname" name="fullname" required>

        <label for="dob">Ngày sinh:</label>
        <input type="date" id="dob" name="dob" required>

        <label for="address">Địa chỉ:</label>
        <textarea id="address" name="address" required></textarea>

        <label for="gender">Giới tính:</label>
        <select id="gender" name="gender">
            <option value="male">Nam</option>
            <option value="female">Nữ</option>
            <option value="other">Khác</option>
        </select>

        <button type="submit">Đăng Ký</button>
    </form>
</div>
</body>
</html>
