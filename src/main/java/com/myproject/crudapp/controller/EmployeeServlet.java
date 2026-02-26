package com.myproject.crudapp.controller;

import com.myproject.crudapp.model.dao.EmployeeDAO;
import com.myproject.crudapp.model.dao.EmployeeDAOExcep;
import com.myproject.crudapp.model.dao.EmployeeDAOImp;
import com.myproject.crudapp.model.entity.Employee;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = {"/","/employee"})
public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        dao = new EmployeeDAOImp();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        if (action == null) action = "list";

        try {
            switch (action) {

                case "add" -> {
                    openInsertForm(req, resp);
                }

                case "edit" -> {
                    openUpdateForm(req, resp);
                }

                case "insert" -> {
                    insertEmployee(req, resp);
                }

                case "update" -> {
                    updateEmployee(req, resp);
                }

                case "delete" -> {
                    deleteEmployee(req, resp);
                }

                case "list" -> {
                    displayEmployees(req, resp);
                }

                case "cancel" -> {
                    cancelForm(req, resp);
                }
            }

        } catch (EmployeeDAOExcep exception) {
            req.setAttribute("errmsg", exception.getMessage());
            req.setAttribute("errcause", exception.getCause());
            req.setAttribute("errexception", exception);
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }

    }

    private void displayEmployees(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Employee> elist = dao.displayRecords();
        req.setAttribute("list", elist);
        req.getRequestDispatcher("list.jsp").forward(req, resp);
    }

    private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteRecord(id);
        resp.sendRedirect("employee?action=list&msg1=record deleted successfully");
    }

    private void openInsertForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("form.jsp");
    }

    private void openUpdateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Employee e = dao.getRecordById(id);
        req.setAttribute("emp", e);
        req.getRequestDispatcher("form.jsp").forward(req, resp);
    }

    private void insertEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String department = req.getParameter("department");
        String designation = req.getParameter("designation");
        String salary = req.getParameter("salary");

        if (!validate(req, name, email, department, designation, salary)) {
            req.getRequestDispatcher("form.jsp").forward(req, resp);
            return;
        }

        Employee e = new Employee(name, email, department, designation, Float.parseFloat(salary));
        dao.insertRecord(e);
        resp.sendRedirect("employee?action=list&msg2=record inserted successfully");
    }

    private void updateEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String department = req.getParameter("department");
        String designation = req.getParameter("designation");
        String salary = req.getParameter("salary");

        if (!validate(req, name, email, department, designation, salary)) {
            req.setAttribute("emp",new Employee(id,name,email,department,designation,Float.parseFloat(salary)));
            req.getRequestDispatcher("form.jsp").forward(req, resp);
            return;
        }

        Employee e = new Employee(id, name, email, department, designation, Float.parseFloat(salary));
        dao.updateRecord(e);
        resp.sendRedirect("employee?action=list&msg3=record updated successfully");
    }

    private void cancelForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("employee?action=list");
    }

    private boolean validate(HttpServletRequest req, String name, String email, String department, String designation, String salary) throws ServletException, IOException {

        boolean flag = true;

        if (name == null || name.trim().isEmpty() || !Pattern.matches("^[A-Za-z ]{2,50}$", name)) {
            req.setAttribute("nameerror", "Name is required and must contain only alphabets (2–50 characters).");
            return false;
        }

        if (email == null || email.trim().isEmpty() || !Pattern.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$", email)) {
            req.setAttribute("emailerror", "Email is required and must be a valid email address (eg- name10@gmail.com).");
            return false;
        }

        if (department == null || department.trim().isEmpty() || !Pattern.matches("^[A-Za-z ]{2,50}$", department)) {
            req.setAttribute("departmenterror", "Department is required and must contain only alphabets (2-50 characters)");
            return false;
        }

        if (designation == null || designation.trim().isEmpty() || !Pattern.matches("^[A-Za-z ]{2,50}$", department)) {
            req.setAttribute("designationerror", "Designation is required and must contain only alphabets (2-50 characters)");
            return false;
        }

        if (salary==null || salary.isEmpty() ||Float.parseFloat(salary)<=0) {
            req.setAttribute("salaryerror", "Salary is required and must be greater than or equal to zero 0");
            return false;
        }
        return flag;

    }

}
