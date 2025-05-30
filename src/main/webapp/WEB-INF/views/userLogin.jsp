<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body, html {
            height: 100%;
            background-color: #f4f9ff;
            overflow-x: hidden;
        }

        /* Animated Background */
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(270deg, #f4f9ff, #e1f0ff, #f4f9ff);
            background-size: 600% 600%;
            animation: gradientShift 15s ease infinite;
            z-index: -1;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Header styles */
        header {
            position: fixed;
            top: 0; left: 0; right: 0;
            height: 70px;
            background: #63b3ed;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
            z-index: 1000;
        }

        header .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff;
            letter-spacing: 1px;
            user-select: none;
        }

        header nav a {
            color: #ffffff;
            text-decoration: none;
            font-size: 1rem;
            margin-left: 30px;
            transition: color 0.3s ease;
        }

        header nav a:hover {
            color: #bee3f8;
        }

        /* Footer styles */
        footer {
            position: fixed;
            bottom: 0; left: 0; right: 0;
            background: #d0e7ff;
            color: #3b5998;
            padding: 15px 40px;
            text-align: center;
            font-size: 0.9rem;
            box-shadow: 0 -2px 6px rgba(0,0,0,0.1);
            user-select: none;
        }

        /* Main container for login */
        main {
            min-height: 100vh;
            padding: 100px 20px 80px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 400px;
            background: #ffffff;
            border-radius: 15px;
            padding: 40px 35px;
            box-shadow: 0 10px 25px rgba(99, 179, 237, 0.3);
            transition: box-shadow 0.3s ease;
        }

        .container:hover {
            box-shadow: 0 15px 35px rgba(99, 179, 237, 0.6);
        }

        .container h2 {
            color: #1a365d;
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .form-group {
            position: relative;
            margin-bottom: 30px;
        }

        .form-group input {
            width: 100%;
            padding: 15px;
            background: #f7fbff;
            border: 2px solid #63b3ed;
            outline: none;
            border-radius: 8px;
            color: #1a365d;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            border-color: #3182ce;
            box-shadow: 0 0 8px rgba(49, 130, 206, 0.5);
        }

        .form-group label {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #7b8aac;
            pointer-events: none;
            transition: 0.3s;
            background: #ffffff;
            padding: 0 5px;
        }

        .form-group input:focus ~ label,
        .form-group input:valid ~ label {
            top: -10px;
            left: 10px;
            font-size: 14px;
            color: #3182ce;
        }

        .btn {
            width: 100%;
            padding: 15px;
            background: #3182ce;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #2c6bb2;
        }

        .links {
            margin-top: 20px;
            text-align: center;
        }

        .links a {
            color: #3182ce;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: #2c6bb2;
        }

        .error-message {
            color: #e53e3e;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #7b8aac;
            user-select: none;
        }

        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }

            header {
                padding: 0 20px;
            }

            footer {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="logo"></div>
    <nav>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
    </nav>
</header>

<main>
    <div class="container">
        <h2>User Login</h2>

        <form action="/login" method="post" id="loginForm">
            <div class="error-message">${error}</div>

            <div class="form-group">
                <input type="email" id="email" name="email" required>
                <label for="email">Email</label>
            </div>

            <div class="form-group">
                <input type="password" id="password" name="password" required>
                <label for="password">Password</label>
                <span class="password-toggle" onclick="togglePassword()">
                    <i class="fas fa-eye"></i>
                </span>
            </div>

            <button type="submit" class="btn">Login</button>

            <div class="links">
                <a href="/register">Don't have an account? Register</a>
            </div>
        </form>
    </div>
</main>

<footer>
</footer>

<script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const icon = document.querySelector('.password-toggle i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const errorMessage = document.querySelector('.error-message');

        if (!email || !password) {
            e.preventDefault();
            errorMessage.textContent = 'Please fill in all fields';
            return;
        }

        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            e.preventDefault();
            errorMessage.textContent = 'Please enter a valid email address';
            return;
        }

        if (password.length < 6) {
            e.preventDefault();
            errorMessage.textContent = 'Password must be at least 6 characters long';
            return;
        }
    });
</script>

</body>
</html>
