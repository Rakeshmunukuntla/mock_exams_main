// ExamController.java
package com.exam.exams_application.controllers;

import com.exam.exams_application.dto.Certification;
import com.exam.exams_application.dto.Exam;
import com.exam.exams_application.dto.Question;
import com.exam.exams_application.utility.ExamXmlParser;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/exam")
public class ExamController {

    Certification cert = new Certification();

    @GetMapping("/start")
    public String startExam(@RequestParam String type, Model model, HttpSession session)
    {
        if(session.getAttribute("userId")==null)
        {
            return "userLogin";
        }
        String xmlPath = switch (type)
        {
            case "Java" -> "/exam-java.xml";
            case "SAP-Hybris" -> "/exam-sap-sample.xml";
            case "Python" ->"/exam-python.xml";
            case  "AEM"->"/exam-AEM.xml";
            case "AWS"->"/exam-AWS.xml";
            case "TECHOPS"->"/exam-tech-ops.xml";
            case "SQL"->"/exam-sql.xml";
            default -> throw new IllegalArgumentException("Invalid exam type");
        };

        Exam exam = ExamXmlParser.parseExamXml(xmlPath);

        if (type.equalsIgnoreCase("java"))
        {
            exam.setExamName("Java Examination");
        }
        else if (type.equalsIgnoreCase("SAP-Hybris"))
        {
            exam.setExamName("SAP-Hybris Examination");
        }
        else if (type.equalsIgnoreCase("Python"))
        {
            exam.setExamName("Python Examination");
        }
        else if (type.equalsIgnoreCase("AWS"))
        {
            exam.setExamName("AWS Examination");
        }
        else if (type.equalsIgnoreCase("TECHOPS"))
        {
            exam.setExamName("TECHOPS Examination");
        }
        else if (type.equalsIgnoreCase("SQL"))
        {
            exam.setExamName("SQL Examination");
        }


        Certification cert = new Certification(); // use local cert, not shared instance!
        cert.setId((String) session.getAttribute("userEmail")); // assuming this is set during login
        cert.setExam(exam);
        cert.setStart(new Date());
        cert.setTotal(exam.getQuestion().size());

        session.setAttribute("cert", cert); // ✅ store in session
        model.addAttribute("cert", cert);
        model.addAttribute("exam", exam);
        return "exam";
    }

    @PostMapping("/submit")
    public String submitExam(@RequestParam MultiValueMap<String, String> formData, Model model, HttpSession session) {
        Certification cert = (Certification) session.getAttribute("cert");
        if (cert == null) {
            throw new IllegalStateException("Certification not found in session");
        }

        List<Question> questions = cert.getExam().getQuestion();
        int score = 0;

        for (Question q : questions) {
            List<String> selectedList = formData.get("q_" + q.getSno());
            Set<String> selectedSet = selectedList != null ? new HashSet<>(selectedList) : new HashSet<>();
            q.setSelectedAnswers(selectedSet);

            if (selectedSet.equals(q.getCorrectAnswers())) {
                q.setCorrect(true);
                score++;
            } else {
                q.setCorrect(false);
            }
        }

        cert.setScore(score);
        cert.setEnd(new Date());

        session.setAttribute("cert", cert); // ✅ update in session
        model.addAttribute("cert", cert);
        return "result";
    }


}
