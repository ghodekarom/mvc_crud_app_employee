package com.myproject.crudapp.model.utils;

import com.myproject.crudapp.model.dao.EmployeeDAOExcep;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static final String JDBC_HOST = (System.getenv("JDBC_HOST")!=null)?System.getenv("JDBC_HOST"):"localhost";
    private static final String JDBC_PORT = (System.getenv("JDBC_PORT")!=null)?System.getenv("JDBC_PORT"):"5432";
    private static final String JDBC_DB = (System.getenv("JDBC_DB")!=null)?System.getenv("JDBC_DB"):"employeedb";
    private static final String JDBC_USERNAME=(System.getenv("JDBC_USERNAME")!=null)?System.getenv("JDBC_USERNAME"):"postgres";
    private static final String JDBC_PASSWORD=(System.getenv("JDBC_PASSWORD")!=null)?System.getenv("JDBC_PASSWORD"):"password";

    private static final String JDBC_URL = "jdbc:postgresql://" + JDBC_HOST + ":" + JDBC_PORT + "/" + JDBC_DB;

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
           c = DriverManager.getConnection(JDBC_URL,JDBC_USERNAME,JDBC_PASSWORD);
        }catch(SQLException se){
            throw new EmployeeDAOExcep("connection failed"+se.getMessage(),se);
        }
        return c;
    }
}
