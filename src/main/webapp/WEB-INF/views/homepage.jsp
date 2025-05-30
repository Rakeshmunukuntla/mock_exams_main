<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Online Certification Exams</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f9ff;
            color: #333;
        }

        /* HEADER with glowing animation */
        .header {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .header-title {
            font-size: 2rem;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 0 0 5px #ffffff, 0 0 10px #ffffff, 0 0 20px #00f2fe, 0 0 30px #00f2fe;
            animation: glow 3s ease-in-out infinite;
        }

        @keyframes glow {
            0% {
                text-shadow: 0 0 5px #ffffff, 0 0 10px #ffffff, 0 0 20px #00f2fe, 0 0 30px #00f2fe;
            }
            50% {
                text-shadow: 0 0 10px #ffffff, 0 0 20px #4facfe, 0 0 30px #4facfe, 0 0 40px #4facfe;
            }
            100% {
                text-shadow: 0 0 5px #ffffff, 0 0 10px #ffffff, 0 0 20px #00f2fe, 0 0 30px #00f2fe;
            }
        }

        /* MAIN CONTENT */
        .main-content {
            padding-top: 140px;
            padding-bottom: 60px;
            max-width: 1000px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }

        .animated-bg {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(270deg, #f4f9ff, #e1f0ff, #f4f9ff);
            background-size: 600% 600%;
            z-index: 0;
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container-box {
            background-color: white;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #007bff;
        }

        .subtitle {
            font-size: 1.5rem;
            margin-bottom: 30px;
            color: #555;
        }

        .features {
            font-size: 1.1rem;
            margin: 20px 0;
            color: #333;
        }

        .login-btn {
            margin-top: 40px;
            padding: 12px 30px;
            font-size: 1.2rem;
            border-radius: 30px;
        }

        /* FOOTER */
        .footer {
            background-color: #d6e9ff;
            color: #333;
            padding: 50px 20px;
            text-align: center;
            margin-top: 40px;
        }

        .footer h4 {
            margin-bottom: 20px;
            font-weight: 600;
        }

        .footer p {
            margin: 8px 0;
            font-size: 1rem;
        }

        .quote {
            font-style: italic;
            color: #555;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- Header with glowing text -->
<div class="header">
    <div class="header-title">Online Certification Portal</div>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="animated-bg"></div> <!-- animated background layer -->
    <div class="container-box">
        <h1>Welcome to Your Exam Portal</h1>
        <p class="subtitle">Empower your future. Prove your skills. Get certified.</p>

        <div class="features">
            <p>🚀 Take industry-relevant certification exams</p>
            <p>💡 Improve your technical knowledge</p>
            <p>📈 Get recognized by top IT companies</p>
            <p>🎯 Real-time results and feedback</p>
        </div>

        <a href="/login" class="btn btn-primary login-btn">Login to Start Exam</a>
    </div>
</div>

<!-- Footer with useful content -->
<div class="footer">
    <h4>About This Portal</h4>
    <p>Designed to help individuals validate their technical skills through real-time certification exams.</p>
    <p><strong>Support Email:</strong> support@examportal.com</p>
    <p><strong>Working Hours:</strong> Mon - Fri: 9:00 AM to 6:00 PM</p>
    <div class="quote">
        "Success is the sum of small efforts, repeated day in and day out."
    </div>
    <p style="margin-top: 20px;">© 2025 Online Certification Portal. All Rights Reserved.</p>
</div>

</body>
</html>
