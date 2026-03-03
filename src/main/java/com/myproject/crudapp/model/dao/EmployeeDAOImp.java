package com.myproject.crudapp.model.dao;

import com.myproject.crudapp.model.entity.Employee;
import com.myproject.crudapp.model.entity.Pagination;
import com.myproject.crudapp.model.utils.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImp implements EmployeeDAO{

    private static final String INSERT_SQL = "insert into employee(name,email,department,designation,salary) values(?,?,?,?,?)";
    private static final String UPDATE_SQL = "update employee set name=?,email=?,department=?,designation=?,salary=? where id=?";
    private static final String DELETE_SQL = "delete from employee where id=?";
    private static final String SEARCH_SQL = "select id,name,email,department,designation,salary from employee where id=?";
    private static final String DISPLAY_SQL = "select id,name,email,department,designation,salary from employee ";
    private static final String PAGINATION_SQL = "limit ? offset ?";
    private static final String COUNT_SQL = "select  count(*) from employee";


    @Override
    public int insertRecord(Employee e) {
        int ans = 0;
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement psinsert = c.prepareStatement(INSERT_SQL)){

            psinsert.setString(1,e.getName());
            psinsert.setString(2,e.getEmail());
            psinsert.setString(3,e.getDepartment());
            psinsert.setString(4,e.getDesignation());
            psinsert.setFloat(5,e.getSalary());

            ans = psinsert.executeUpdate();

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during inserting record"+se.getMessage(),se);
        }
        return ans;
    }

    @Override
    public int updateRecord(Employee e) {
        int ans = 0;
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement psupdate = c.prepareStatement(UPDATE_SQL)){

            psupdate.setString(1,e.getName());
            psupdate.setString(2,e.getEmail());
            psupdate.setString(3,e.getDepartment());
            psupdate.setString(4,e.getDesignation());
            psupdate.setFloat(5,e.getSalary());
            psupdate.setInt(6,e.getId());

            ans = psupdate.executeUpdate();

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during updating record"+se.getMessage(),se);
        }
        return ans;
    }

    @Override
    public int deleteRecord(int id) {
        int ans = 0;
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement psdelete = c.prepareStatement(DELETE_SQL)){

            psdelete.setInt(1,id);

            ans = psdelete.executeUpdate();

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during deleting record"+se.getMessage(),se);
        }
        return ans;
    }

    @Override
    public Employee getRecordById(int id) {
        Employee e = null;
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement pssearch = c.prepareStatement(SEARCH_SQL)){

            pssearch.setInt(1,id);

            try(ResultSet rs = pssearch.executeQuery()){

                if(rs.next()){
                    e = new Employee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getFloat(6));
                }

            }catch(SQLException se){
                throw new EmployeeDAOExcep("error during searching record:"+se.getMessage(),se);
            }

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during searching record:"+se.getMessage(),se);
        }
        return e;
    }

    @Override
    public List<Employee> displayRecords(Pagination pagination) {

        String SQL = DISPLAY_SQL+PAGINATION_SQL; //select * from employee limit ? offset ?

        List<Employee> elist = new ArrayList<Employee>();
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement  psdisplay = c.prepareStatement(SQL);){

            psdisplay.setInt(1,pagination.getPagesize());
            psdisplay.setInt(2,pagination.getOffset());

            try(ResultSet rs = psdisplay.executeQuery()) {

                while (rs.next()) {
                    elist.add(new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6)));
                }
            }catch(SQLException se){
                throw new EmployeeDAOExcep("error during displaying record:"+se.getMessage(),se);
            }

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during displaying records:"+se.getMessage(),se);
        }
        return elist;
    }

    public int countRecords(){
        int totalrecords = 0;
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement pscount = c.prepareStatement(COUNT_SQL);
        ResultSet rs = pscount.executeQuery()){

            if(rs.next()){
                totalrecords =  rs.getInt(1);
            }

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during counting records"+se.getMessage(),se);
        }
        return totalrecords;
    }
}
