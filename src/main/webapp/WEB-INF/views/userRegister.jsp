<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
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
            overflow-x: hidden;
            background-color: #f4f9ff;
        }

        /* Animated Background from login page */
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(270deg, #f4f9ff, #e1f0ff, #f4f9ff);
            background-size: 600% 600%;
            animation: gradientShift 15s ease infinite;
            z-index: -2;
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
            background: #63b3ed; /* brighter blue */
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
            background: #d0e7ff; /* lighter blue */
            color: #3b5998;
            padding: 15px 40px;
            text-align: center;
            font-size: 0.9rem;
            box-shadow: 0 -2px 6px rgba(0,0,0,0.1);
            user-select: none;
            z-index: 1000;
        }

        /* Main content area */
        main {
            min-height: 100vh;
            padding: 100px 20px 80px; /* top padding for header, bottom for footer */
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        /* Modified registration container */
        .register-container {
            position: relative;
            width: 480px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
            background: linear-gradient(145deg, #1e3a8a, #3b82f6);
        }

        /* Animation effect */
        .register-container::before {
            content: '';
            position: absolute;
            top: -4px; left: -4px; right: -4px; bottom: -4px;
            background: linear-gradient(45deg, #f59e0b, #3b82f6, #8b5cf6, #ec4899);
            background-size: 400% 400%;
            border-radius: 18px;
            z-index: -1;
            animation: borderAnimation 8s linear infinite;
            filter: blur(10px);
            opacity: 0.7;
        }

        @keyframes borderAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .register-form {
            padding: 40px 35px;
            display: flex;
            flex-direction: column;
        }

        .register-form h2 {
            color: #ffffff;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .input-row {
            display: flex;
            gap: 20px;
        }

        .input-row .input-box {
            flex: 1;
        }

        .input-box {
            position: relative;
            width: 100%;
            margin-bottom: 25px;
        }

        .input-box input {
            width: 100%;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            outline: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 16px;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
        }

        .input-box input:focus {
            border-color: rgba(255, 255, 255, 0.5);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
        }

        .input-box span {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            pointer-events: none;
            transition: 0.3s;
            padding: 0 5px;
        }

        .input-box input:focus ~ span,
        .input-box input:valid ~ span {
            top: 0;
            left: 10px;
            font-size: 12px;
            color: #ffffff;
            background: #3b82f6;
            padding: 0 8px;
            border-radius: 4px;
        }

        .password-requirements {
            margin-top: 5px;
            margin-bottom: 20px;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            border-left: 4px solid #f59e0b;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
        }

        .password-requirements h3 {
            color: #ffffff;
            font-size: 14px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .password-requirements ul {
            list-style: none;
            padding: 0;
        }

        .password-requirements li {
            color: rgba(255, 255, 255, 0.7);
            font-size: 13px;
            margin: 8px 0;
            display: flex;
            align-items: center;
        }

        .password-requirements li i {
            margin-right: 8px;
            font-size: 14px;
            color: #f87171;
        }

        .password-requirements li.valid i {
            color: #4ade80;
        }

        .password-requirements li.valid {
            color: #ffffff;
        }

        input[type="submit"] {
            padding: 15px;
            background: #f59e0b;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        input[type="submit"]:hover {
            background: #f97316;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        input[type="submit"]:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .links {
            margin-top: 20px;
            text-align: center;
        }

        .links a {
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
            opacity: 0.8;
        }

        .links a:hover {
            opacity: 1;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
        }

        .error-message {
            color: #ffffff;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            background: rgba(220, 38, 38, 0.2);
            padding: 10px;
            border-radius: 5px;
            border-left: 3px solid #ef4444;
            display: none;
        }

        .error-message:not(:empty) {
            display: block;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: rgba(255, 255, 255, 0.7);
            z-index: 5;
        }

        .password-toggle:hover {
            color: #ffffff;
        }

        /* Responsive */
        @media (max-width: 520px) {
            .register-container {
                width: 95%;
                margin: 20px auto;
            }

            .input-row {
                flex-direction: column;
                gap: 0;
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

    </header>

    <main>
        <div class="register-container">
            <form class="register-form" action="/register" method="post" id="registerForm">
                <h2>User Registration</h2>

                <div class="error-message">${error}</div>

                <div class="input-row">
                    <div class="input-box">
                        <input type="text" id="firstName" name="firstName" required>
                        <span>First Name</span>
                    </div>

                    <div class="input-box">
                        <input type="text" id="lastName" name="lastName" required>
                        <span>Last Name</span>
                    </div>
                </div>

                <div class="input-box">
                    <input type="text" id="name" name="name" required>
                    <span>Username</span>
                </div>

                <div class="input-box">
                    <input type="email" id="email" name="email" required>
                    <span>Email</span>
                </div>

                <div class="input-box">
                    <input type="password" id="password" name="password" required>
                    <span>Password</span>
                    <div class="password-toggle" onclick="togglePassword()">
                        <i class="fas fa-eye"></i>
                    </div>
                </div>

                <div class="password-requirements">
                    <h3>Password Requirements:</h3>
                    <ul>
                        <li id="length"><i class="fas fa-times"></i>At least 6 characters</li>
                        <li id="uppercase"><i class="fas fa-times"></i>One uppercase letter</li>
                        <li id="lowercase"><i class="fas fa-times"></i>One lowercase letter</li>
                        <li id="number"><i class="fas fa-times"></i>One number</li>
                    </ul>
                </div>

                <input type="submit" value="Register">
                <div class="links">
                    <a href="/login">Already have an account? Login</a>
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

        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;

            // Update password requirements
            document.getElementById('length').className =
                password.length >= 6 ? 'valid' : '';
            document.getElementById('uppercase').className =
                /[A-Z]/.test(password) ? 'valid' : '';
            document.getElementById('lowercase').className =
                /[a-z]/.test(password) ? 'valid' : '';
            document.getElementById('number').className =
                /[0-9]/.test(password) ? 'valid' : '';

            // Update icons
            document.querySelectorAll('.password-requirements li').forEach(li => {
                const icon = li.querySelector('i');
                if (li.className === 'valid') {
                    icon.className = 'fas fa-check';
                } else {
                    icon.className = 'fas fa-times';
                }
            });
        });

        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            const username = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const errorMessage = document.querySelector('.error-message');

            if (!firstName || !lastName || !username || !email || !password) {
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

            if (password.length < 6 || !/[A-Z]/.test(password) ||
                !/[a-z]/.test(password) || !/[0-9]/.test(password)) {
                e.preventDefault();
                errorMessage.textContent = 'Password does not meet requirements';
                return;
            }
        });
    </script>
</body>
</html>