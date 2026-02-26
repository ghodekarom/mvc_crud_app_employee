package com.myproject.crudapp.model.utils;

import com.myproject.crudapp.model.dao.EmployeeDAOExcep;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/employeedb";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "password";

    static{
       try{
           Class.forName("org.postgresql.Driver");
       }catch(ClassNotFoundException cnfe){
           throw new EmployeeDAOExcep("postgresql driver not found"+cnfe.getMessage(),cnfe);
       }
    }

    public static Connection fetchConnection(){
        Connection c = null;
        try{
           c = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
        }catch(SQLException se){
            throw new EmployeeDAOExcep("connection failed"+se.getMessage(),se);
        }
        return c;
    }
}
