package com.exam.exams_application.controllers;


import com.exam.exams_application.model.UserModel;
import com.exam.exams_application.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController
{
    @Autowired
    private UserService userService;


    @GetMapping("/login")
    public String showLoginPage()
    {
        return "userLogin";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session)
    {
        UserModel user=userService.findByEmailAndPassword(email,password);
        if (user!=null)
        {

            session.setAttribute("userId", user.getId());
            session.setAttribute("userEmail",user.getEmail());
            session.setAttribute("userFirstName", user.getFirstName());
            session.setAttribute("userLastName",user.getLastName());
            return "redirect:/homepage";
        }
        else
        {
            model.addAttribute("error", "Invalid email or password");
            return "userLogin";
        }
    }


    @GetMapping("/register")
    public String showRegisterPage(Model model)
    {
        model.addAttribute("admin", new UserModel());
        return "userRegister";
    }


    @PostMapping("/register")
    public String register(@ModelAttribute UserModel user, Model model)
    {

        UserModel user1=userService.findByEmail(user.getEmail());
        if (user1!=null)
        {
            model.addAttribute("error", "Email already registered");
            return "userRegister";
        }

        userService.saveAdmin(user);
        //model.addAttribute("error", "Registered succussfully please log in..");
        return "registrationsuccess1";
    }



    @GetMapping("/logout")
    public String logout(HttpSession session)
    {
        session.invalidate();
        return "redirect:/";
    }
}
