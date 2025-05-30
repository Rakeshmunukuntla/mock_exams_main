<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
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

        .success-container {
            position: relative;
            width: 400px;
            height: 450px;
            border-radius: 15px;
            overflow: hidden;
            animation: containerAppear 0.5s ease-out;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        @keyframes containerAppear {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .success-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 400px;
            height: 450px;
            background: linear-gradient(60deg, transparent, #4CAF50, #4CAF50);
            transform-origin: bottom right;
            animation: animate 6s linear infinite;
        }

        .success-container::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 400px;
            height: 450px;
            background: linear-gradient(60deg, transparent, #63b3ed, #63b3ed);
            transform-origin: bottom right;
            animation: animate 6s linear infinite;
            animation-delay: -3s;
        }

        @keyframes animate {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .success-content {
            position: absolute;
            inset: 2px;
            border-radius: 15px;
            background: linear-gradient(145deg, #3b82f6, #1e3a8a);
            z-index: 10;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .success-icon {
            width: 100px;
            height: 100px;
            background: #4CAF50;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
            animation: iconPop 0.5s ease-out 0.3s both;
            box-shadow: 0 0 25px rgba(76, 175, 80, 0.5);
        }

        @keyframes iconPop {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        .success-icon i {
            color: white;
            font-size: 50px;
            animation: checkmark 0.5s ease-out 0.8s both;
        }

        @keyframes checkmark {
            from {
                transform: scale(0) rotate(-45deg);
            }
            to {
                transform: scale(1) rotate(0);
            }
        }

        .success-title {
            color: #ffffff;
            font-size: 24px;
            margin-bottom: 15px;
            text-align: center;
            animation: fadeIn 0.5s ease-out 1s both;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .success-message {
            color: rgba(255, 255, 255, 0.9);
            text-align: center;
            margin-bottom: 30px;
            line-height: 1.6;
            animation: fadeIn 0.5s ease-out 1.2s both;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-button {
            background: linear-gradient(45deg, #4CAF50, #63b3ed);
            border: none;
            padding: 15px 40px;
            border-radius: 25px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            animation: fadeIn 0.5s ease-out 1.4s both;
            position: relative;
            overflow: hidden;
            font-weight: 600;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                120deg,
                transparent,
                rgba(255, 255, 255, 0.3),
                transparent
            );
            transition: 0.5s;
        }

        .login-button:hover::before {
            left: 100%;
        }

        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(76, 175, 80, 0.4);
        }

        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #45f3ff;
            animation: confetti 5s ease-in-out infinite;
            z-index: 500;
        }

        @keyframes confetti {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(720deg);
                opacity: 0;
            }
        }

        /* Responsive */
        @media (max-width: 520px) {
            .success-container {
                width: 95%;
                height: auto;
                min-height: 400px;
            }

            header {
                padding: 0 20px;
            }

            footer {
                padding: 10px 20px;
            }

            .success-content {
                padding: 40px 25px;
            }
        }
    </style>
</head>
<body>
    <header>

    </header>

    <main>
        <div class="success-container">
            <div class="success-content">
                <div class="success-icon">
                    <i class="fas fa-check"></i>
                </div>
                <h2 class="success-title">Registration Successful!</h2>
                <p class="success-message">
                    Your User account has been created successfully.<br>
                    Please login to continue.
                </p>
                <a href="/login" class="login-button">
                    Proceed to Login
                </a>
            </div>
        </div>
    </main>

    <footer>

    </footer>

    <script>
        // Create confetti effect
        function createConfetti() {
            for(let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.classList.add('confetti');

                // Random position
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                confetti.style.opacity = Math.random();
                confetti.style.transform = `rotate(${Math.random() * 360}deg)`;

                // Random color - updated to match blue theme with green success
                const colors = ['#4CAF50', '#63b3ed', '#ffffff', '#3b82f6', '#bee3f8'];
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];

                document.body.appendChild(confetti);

                // Remove confetti after animation
                setTimeout(() => {
                    confetti.remove();
                }, 5000);
            }
        }

        // Initial confetti burst
        createConfetti();

        // Repeat confetti every few seconds
        setInterval(createConfetti, 5000);
    </script>
</body>
</html>