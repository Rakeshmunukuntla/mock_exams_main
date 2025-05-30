<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Result</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

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
            color: #2c3e50;
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
            margin-top: 40px;
        }

        /* Main content area */
        main {
            padding: 100px 20px 40px; /* top padding for header */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: calc(100vh - 70px - 49px); /* viewport - header - footer */
        }

        h2 {
            text-align: center;
            color: #3182ce;
            margin-bottom: 20px;
            font-size: 2.2rem;
            font-weight: 700;
            animation: fadeIn 0.6s ease-in-out;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }

        /* Action buttons at top */
        .action-buttons-top {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 0 0 25px;
            flex-wrap: wrap;
            width: 100%;
            max-width: 900px;
        }

        .score-bar {
            width: 100%;
            max-width: 500px;
            margin: 20px auto 30px;
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(99, 179, 237, 0.3);
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            color: #ffffff;
            background: linear-gradient(to right, #3182ce, #63b3ed);
            animation: scaleUp 0.7s ease-out;
            position: relative;
            overflow: hidden;
        }

        .score-bar::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1), rgba(255,255,255,0));
            z-index: 1;
        }

        .summary {
            width: 100%;
            max-width: 600px;
            margin: 0 auto 30px;
            background: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 16px;
            color: #4a5568;
            animation: fadeIn 0.8s ease-out;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .summary p {
            margin: 10px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .summary b {
            color: #3182ce;
            font-size: 1.1em;
            margin-bottom: 5px;
        }

        .container {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .question-card {
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            animation: slideUp 0.6s ease;
            border-left: 4px solid #3182ce;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .question-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }

        .question-card p {
            margin: 12px 0;
            font-size: 16px;
            line-height: 1.6;
        }

        .question-card p b {
            color: #3182ce;
        }

        .answers {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin: 10px 0 20px;
        }

        .answers span {
            display: inline-block;
            background-color: #e2e8f0;
            color: #4a5568;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 14px;
            transition: transform 0.2s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .answers span:hover {
            transform: translateY(-2px);
        }

        .answers span.correct-answer {
            background-color: #c6f6d5;
            color: #2f855a;
        }

        .answers span.wrong-answer {
            background-color: #fed7d7;
            color: #c53030;
        }

        .result-tag {
            font-weight: bold;
            font-size: 18px;
            padding: 10px 15px;
            border-radius: 8px;
            display: inline-block;
            margin-top: 10px;
        }

        .correct {
            color: #2f855a;
            background-color: rgba(198, 246, 213, 0.3);
        }

        .incorrect {
            color: #c53030;
            background-color: rgba(254, 215, 215, 0.3);
        }

        .action-button {
            padding: 12px 24px;
            background: #3182ce;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 6px rgba(49, 130, 206, 0.25);
        }

        .action-button:hover {
            background: #2c5282;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(49, 130, 206, 0.3);
        }

        .action-button i {
            margin-right: 8px;
        }

        .pdf-button {
            background: linear-gradient(to right, #e53e3e, #f56565);
        }

        .pdf-button:hover {
            background: linear-gradient(to right, #c53030, #e53e3e);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes scaleUp {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        #pdf-content {
            display: none;
        }

        @media (max-width: 768px) {
            header {
                padding: 0 20px;
            }

            header nav a {
                margin-left: 15px;
                font-size: 0.9rem;
            }

            .score-bar {
                font-size: 22px;
                padding: 20px;
            }

            .question-card {
                padding: 20px;
            }

            .action-buttons-top {
                flex-direction: column;
                align-items: center;
            }

            .action-button {
                width: 100%;
                max-width: 250px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }

            .summary {
                flex-direction: column;
                padding: 15px;
            }

            .summary p {
                margin: 5px 0;
            }

            .answers span {
                font-size: 13px;
                padding: 6px 10px;
            }
        }
    </style>
</head>
<body>
    <header>

    </header>

    <main>
        <h2><i class="fas fa-award"></i> Exam Result</h2>

        <!-- Action Buttons at Top -->
        <div class="action-buttons-top">
            <a href="/" class="action-button">
                <i class="fas fa-home"></i> Back to Home
            </a>
            <a href="/homepage" class="action-button">
                <i class="fas fa-clipboard-list"></i> Take Another Exam
            </a>
            <a href="${pageContext.request.contextPath}/download-result" class="action-button pdf-button">
                <i class="fas fa-file-pdf"></i> Download Result as PDF
            </a>
        </div>

        <!-- Score Bar -->
        <div class="score-bar">
            Score : ${cert.score} / ${cert.total}
        </div>
          <div class="score-bar">
                    Percentage : ${cert.score*100/cert.total} %
                </div>
        <!-- Summary Details -->
        <div class="summary">
            <p>
                <b><i class="far fa-clock"></i> Start Time</b>
                <span>${cert.start}</span>
            </p>
            <p>
                <b><i class="far fa-clock"></i> End Time</b>
                <span>${cert.end}</span>
            </p>
        </div>

        <!-- Questions -->
        <div class="container" id="result-content">
            <c:forEach items="${cert.exam.question}" var="q" varStatus="status">
                <div class="question-card" style="animation-delay: ${status.index * 0.1}s">
                    <p><b>Question ${1+q.sno}:</b> ${q.qText}</p>

                    <p><b><i class="fas fa-user-edit"></i> Your Answer(s):</b></p>
                    <div class="answers">
                        <c:forEach items="${q.selectedAnswers}" var="sel" varStatus="status">
                            <span class="${q.correctAnswers.contains(sel) ? 'correct-answer' : 'wrong-answer'}">
                                ${sel}: <c:out value="${q.options[sel]}" default="(Invalid Option)"/>
                            </span>
                        </c:forEach>
                    </div>

                    <p><b><i class="fas fa-check-circle"></i> Correct Answer(s):</b></p>
                    <div class="answers">
                        <c:forEach items="${q.correctAnswers}" var="ans">
                            <span class="correct-answer">
                                ${ans}: <c:out value="${q.options[ans]}" default="(Invalid Option)"/>
                            </span>
                        </c:forEach>
                    </div>

                    <p class="result-tag ${q.correct ? 'correct' : 'incorrect'}">
                        ${q.correct ? '✓ Correct' : '✗ Incorrect'}
                    </p>
                </div>
            </c:forEach>
        </div>
    </main>

    <footer>

    </footer>
</body>
</html>