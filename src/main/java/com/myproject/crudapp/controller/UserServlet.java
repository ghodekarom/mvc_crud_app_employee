package com.myproject.crudapp.controller;

import com.myproject.crudapp.model.dao.EmployeeDAOExcep;
import com.myproject.crudapp.model.dao.UserDAO;
import com.myproject.crudapp.model.dao.UserDAOImp;
import com.myproject.crudapp.model.entity.User;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;

@WebServlet(urlPatterns={"/","/auth"})
public class UserServlet extends HttpServlet {

    UserDAO dao;
    @Override
    public void init(ServletConfig config) throws ServletException {
        dao = new UserDAOImp();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action=req.getParameter("action");

        if(action==null)action="login";

        try{

            switch(action){

                case "login" ->
                {
                    login(req,resp);
                }

                case "register" ->
                {
                    register(req,resp);
                }

                case "doRegister"->
                {
                    doRegister(req,resp);
                }

                case "doLogin" ->
                {
                    doLogin(req,resp);
                }

                case "logout" ->
                {
                    logout(req,resp);
                }

            }

        }catch(EmployeeDAOExcep exception){
             req.setAttribute("excepmsg",exception.getMessage());
             req.setAttribute("excepcause",exception.getCause());
             req.setAttribute("excep",exception);
             req.getRequestDispatcher("error.jsp").forward(req,resp);
        }

    }

    private void login(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{

        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    private void register(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{

        req.getRequestDispatcher("register.jsp").forward(req,resp);
    }

    private void doRegister(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{

        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String userpassword = req.getParameter("userpassword");

        if(dao.exists(username)){
            resp.sendRedirect("auth?action=register&msg1=user already exists");
            return;
        }

        User user = new User(name,username,userpassword);
        dao.register(user);
        resp.sendRedirect("auth?action=login&msg1=user registered successfully");
    }

    private void doLogin(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{

        String username = req.getParameter("username");
        String userpassword = req.getParameter("userpassword");

        User user = dao.login(username,userpassword);
        if(user==null){
            resp.sendRedirect("auth?action=login&msg2=invalid credentials");
        }else{
           req.getSession().setAttribute("user",user);
           resp.sendRedirect("employee"); //go to dashboard with loggedin user using session
        }
    }

    private void logout(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        req.getSession().invalidate();
        resp.sendRedirect("auth?action=login");
    }

}
