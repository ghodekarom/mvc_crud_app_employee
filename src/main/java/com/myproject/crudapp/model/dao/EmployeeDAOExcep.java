package com.myproject.crudapp.model.dao;

public class EmployeeDAOExcep extends RuntimeException {
    public EmployeeDAOExcep(String message,Throwable cause) {
        super(message,cause);
    }
}
