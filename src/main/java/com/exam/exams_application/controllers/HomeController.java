package com.exam.exams_application.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/homepage")
    public String homePage(HttpSession session)
    {
        if(session.getAttribute("userId")==null)
        {
            return "userLogin";
        }
        return "home"; // home.jsp or home.html
    }
    @GetMapping("/")
    public String home(HttpSession session)
    {

        return "homepage"; // home.jsp or home.html
    }
}
