<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Certification Exam</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #fdfcfb, #e2d1c3);
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in;
        }

        h2 {
            text-align: center;
            padding-top: 30px;
            color: #2c3e50;
            font-size: 36px;
            animation: popIn 1s ease;
        }

        #timer-container {
            text-align: center;
            margin-bottom: 10px;
        }

        #timer {
            display: inline-block;
            font-size: 20px;
            color: #e63946;
            font-weight: bold;
            padding: 8px 15px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container {
            max-width: 850px;
            margin: 30px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: slideUp 1s ease-out;
        }

        .question-block {
            margin-bottom: 30px;
            padding: 20px;
            border-left: 5px solid #a8dadc;
            background: #f8f9fa;
            border-radius: 10px;
            transition: background-color 0.3s;
        }

        .question-block:hover {
            background-color: #edf6f9;
        }

        .question-text {
            font-weight: bold;
            color: #1d3557;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .option-label {
            display: block;
            padding: 10px 15px;
            margin: 8px 0;
            background-color: #f1f3f5;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.2s;
            cursor: pointer;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.05);
        }

        .option-label:hover {
            background-color: #dee2e6;
            transform: scale(1.01);
        }

        input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.2);
        }

        .submit-btn {
            background-color: #0077b6;
            color: white;
            padding: 14px 30px;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            cursor: pointer;
            display: block;
            margin: 20px auto 0;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #023e8a;
        }

        .progress-bar {
            width: 80%;
            height: 20px;
            background-color: #dee2e6;
            border-radius: 20px;
            margin: 10px auto 30px;
            overflow: hidden;
            box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
        }

        .progress-bar-fill {
            height: 100%;
            width: 100%;
            background-color: #00b4d8;
            transition: width 1s linear;
        }

        @keyframes progressAnim {
            from { width: 0; }
            to { width: 100%; }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes popIn {
            0% { transform: scale(0.9); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 28px;
            }

            .submit-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <h2>Certification Exam</h2>

    <div id="timer-container">
        <div id="timer">Time Left: 00:00</div>
    </div>

    <div class="progress-bar">
        <div class="progress-bar-fill"></div>
    </div>

    <form class="container" action="/exam/submit" method="post">
        <c:forEach items="${exam.question}" var="q">
            <div class="question-block">
                <p class="question-text"><b>Q${1+q.sno}:</b> ${q.qText}</p>
                <c:forEach items="${q.options}" var="entry">
                    <label class="option-label">
                        <input type="checkbox" name="q_${q.sno}" value="${entry.key}" />
                        ${entry.key}: ${entry.value}
                    </label>
                </c:forEach>
            </div>
        </c:forEach>

        <input class="submit-btn" type="submit" value="Submit Exam" />
    </form>

    <!-- Timer + Progress Bar -->
    <script>
        // Wait for the DOM to be fully loaded
        document.addEventListener("DOMContentLoaded", function() {
            console.log("DOM loaded");

            // Get references to timer and progress bar elements
            var timerElement = document.getElementById("timer");
            var progressBarFill = document.querySelector(".progress-bar-fill");

            // Set up timer variables
            //var totalTime = 600;
            var totalTime =${exam.question.size()*60};
            var timeRemaining = totalTime;

            // Function to format time as MM:SS
            function formatTime(seconds) {
                var minutes = Math.floor(seconds / 60);
                var secs = seconds % 60;
                return minutes + ":" + (secs < 10 ? "0" + secs : secs);
            }

            // Function to update the timer display and progress bar
            function updateTimer() {
                // Update time remaining
                timeRemaining--;

                if (timeRemaining <= 0) {
                    // Time's up
                    timerElement.textContent = "Time Left: 0:00";
                    progressBarFill.style.width = "0%";
                    clearInterval(timerInterval);

                    // Submit the form
                    alert("Time's up! Submitting your exam.");
                    document.querySelector("form").submit();
                    return;
                }

                // Update timer display
                timerElement.textContent = "Time Left: " + formatTime(timeRemaining);

                // Update progress bar
                var progressPercentage = (timeRemaining / totalTime) * 100;
                progressBarFill.style.width = progressPercentage + "%";
            }

            // Set initial timer display
            timerElement.textContent = "Time Left: " + formatTime(timeRemaining);

            // Start timer interval (update every second)
            var timerInterval = setInterval(updateTimer, 1000);
        });
    </script>

</body>
</html>