<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Certification Exams</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Segoe UI', 'Roboto', sans-serif;
            min-height: 100vh;
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
            background: #d0e7ff; /* lighter blue */
            color: #3b5998;
            padding: 15px 40px;
            text-align: center;
            font-size: 0.9rem;
            box-shadow: 0 -2px 6px rgba(0,0,0,0.1);
            user-select: none;
            position: relative;
            z-index: 10;
        }

        /* Main content area */
        main {
            min-height: calc(100vh - 70px - 49px); /* viewport - header - footer */
            padding: 100px 20px 40px; /* top padding for header */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 1200px;
            width: 100%;
            padding: 0 15px;
            animation: fadeIn 1.2s ease;
        }

        .text-center {
            text-align: center;
        }

        h1 {
            font-weight: 700;
            color: #3182ce;
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }

        .lead {
            color: #4a5568;
            font-size: 1.25rem;
            margin-bottom: 3rem;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
            justify-content: center;
        }

        .col-md-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            padding: 0 15px;
            margin-bottom: 30px;
        }

        .card {
            height: 100%;
            display: block;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
            position: relative;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(145deg, #3b82f6, #1e3a8a);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: 1;
            border-radius: 15px;
        }

        .card:hover::before {
            opacity: 1;
        }

        .card-body {
            position: relative;
            z-index: 2;
            padding: 2.5rem;
            background: white;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .card:hover .card-body {
            transform: translateY(-5px);
            color: white;
            background: transparent;
        }

        .card-title {
            font-weight: 600;
            color: #3182ce;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            transition: color 0.3s ease;
        }

        .card:hover .card-title {
            color: white;
        }

        .card-text {
            color: #4a5568;
            margin-bottom: 0;
            transition: color 0.3s ease;
        }

        .card:hover .card-text {
            color: rgba(255, 255, 255, 0.9);
        }

        .card-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            color: #3182ce;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .card:hover .card-icon {
            color: white;
            transform: scale(1.1);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        /* Additional action button */
        .action-button {
            display: inline-block;
            margin-top: 2rem;
            padding: 12px 24px;
            background: #3182ce;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(49, 130, 206, 0.25);
            transition: all 0.3s ease;
        }

        .action-button:hover {
            background: #2c5282;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(49, 130, 206, 0.3);
        }

        @media (max-width: 992px) {
            .col-md-4 {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        @media (max-width: 768px) {
            header {
                padding: 0 20px;
            }

            header nav a {
                margin-left: 15px;
                font-size: 0.9rem;
            }

            .col-md-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }

            h1 {
                font-size: 2rem;
            }

            .lead {
                font-size: 1.1rem;
            }

            .card-title {
                font-size: 1.25rem;
            }
        }

        @media (max-width: 480px) {
            main {
                padding-top: 90px;
            }

            .card-body {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <header>

    </header>

    <main>
        <div class="container text-center">
            <h1>Welcome to Certification Portal</h1>
            <p class="lead">Choose the exam you want to take to validate your skills</p>

            <div class="row">
                <div class="col-md-4">
                    <a href="/exam/start?type=Java" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fab fa-java"></i>
                            </div>
                            <h5 class="card-title">Java Certification</h5>
                            <p class="card-text">Validate your Java programming skills and enhance your career prospects.</p>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="/exam/start?type=Python" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fab fa-python"></i>
                            </div>
                            <h5 class="card-title">Python Certification</h5>
                            <p class="card-text">Demonstrate your Python programming proficiency and data science skills.</p>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="/exam/start?type=SAP-Hybris" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                            <h5 class="card-title">SAP-Hybris Certification</h5>
                            <p class="card-text">Demonstrate your expertise in SAP Commerce and e-commerce solutions.</p>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="/exam/start?type=AEM" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fab fa-adobe"></i>
                            </div>
                            <h5 class="card-title">AEM Certification</h5>
                            <p class="card-text">Validate your Adobe Experience Manager skills for content management.</p>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="/exam/start?type=AWS" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fab fa-aws"></i>
                            </div>
                            <h5 class="card-title">AWS Certification</h5>
                            <p class="card-text">Prove your cloud computing skills with our comprehensive AWS exam.</p>
                        </div>
                    </a>
                </div>



                <!-- SQL Certification -->
                <div class="col-md-4">
                    <a href="/exam/start?type=SQL" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-database"></i>
                            </div>
                            <h5 class="card-title">SQL Certification</h5>
                            <p class="card-text">Validate your database querying and management skills with our SQL exam.</p>
                        </div>
                    </a>
                </div>

                <!-- Tech-Ops in SAP Certification -->
                <div class="col-md-4">
                    <a href="/exam/start?type=TECHOPS" class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-cogs"></i>
                            </div>
                            <h5 class="card-title">Tech-Ops in SAP</h5>
                            <p class="card-text">Test your knowledge in SAP Technical Operations with real-world scenarios.</p>
                        </div>
                    </a>
                </div>
                </div>

            <a href="/" class="action-button">
                <i class="fas fa-user-circle"></i> Go to Dashboard
            </a>
        </div>
    </main>

    <footer>

    </footer>
</body>
</html>