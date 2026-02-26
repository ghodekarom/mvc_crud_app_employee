package com.myproject.crudapp.model.dao;

import com.myproject.crudapp.model.entity.Employee;

import java.util.List;

public interface EmployeeDAO {

    int insertRecord(Employee e);
    int updateRecord(Employee e);
    int deleteRecord(int id);
    Employee getRecordById(int id);
    List<Employee> displayRecords();

}
