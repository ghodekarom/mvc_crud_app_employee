package com.myproject.crudapp.model.testing;

import com.myproject.crudapp.model.dao.EmployeeDAO;
import com.myproject.crudapp.model.dao.EmployeeDAOImp;
import com.myproject.crudapp.model.entity.Employee;

import java.util.List;
import java.util.Scanner;

public class TestEmployee {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        EmployeeDAO dao = new EmployeeDAOImp();

        int id;
        String name;
        String email;
        String department;
        String designation;
        float salary;
        Employee e =null;

        int ans;

        try{
            int ch = 0;
            do
            {
                System.out.println("1:INSERT");
                System.out.println("2:UPDATE");
                System.out.println("3:DELETE");
                System.out.println("4:SEARCH");
                System.out.println("5:DISPLAY");
                System.out.println("6:EXIT");
                System.out.println("enter choice:");
                ch = scanner.nextInt();
                scanner.nextLine();

                switch(ch) {
                    case 1 -> {
                        System.out.println("enter employee-name to be inserted:");
                        name = scanner.nextLine();
                        System.out.println("enter employee-email to be inserted:");
                        email = scanner.nextLine();
                        System.out.println("enter employee-department to be inserted:");
                        department = scanner.nextLine();
                        System.out.println("enter employee-designation to be inserted:");
                        designation = scanner.nextLine();
                        System.out.println("enter employee-salary to be inserted:");
                        salary = scanner.nextFloat();
                        e = new Employee(name, email, department, designation, salary);
                        ans = dao.insertRecord(e);
                        if (ans > 0) {
                            System.out.println("record inserted successfully");
                        } else {
                            System.out.println("record not inserted");
                        }
                    }

                    case 2 -> {
                        System.out.println("enter employee-id to be updated:");
                        id = scanner.nextInt();
                        scanner.nextLine();
                        System.out.println("enter employee-name:");
                        name = scanner.nextLine();
                        System.out.println("enter employee-email:");
                        email = scanner.nextLine();
                        System.out.println("enter employee-department:");
                        department = scanner.nextLine();
                        System.out.println("enter employee-designation:");
                        designation = scanner.nextLine();
                        System.out.println("enter employee-salary:");
                        salary = scanner.nextFloat();
                        e = new Employee(id,name,email,department,designation,salary);
                        ans = dao.updateRecord(e);
                        if (ans > 0)
                            System.out.println("record updated successfully");
                        else
                            System.out.println("record not updated");
                    }

                    case 3 -> {
                        System.out.println("enter employee-id to be deleted:");
                        id = scanner.nextInt();
                        ans = dao.deleteRecord(id);
                        if (ans > 0)
                            System.out.println("record deleted successfully");
                        else
                            System.out.println("record not deleted");
                    }

                    case 4 -> {
                        System.out.println("enter record to be searched:");
                        id = scanner.nextInt();
                        e = dao.getRecordById(id);
                        if (e != null) {
                            System.out.println("record found");
                            System.out.println(e);
                        } else {
                            System.out.println("record not found");
                        }
                    }

                    case 5 -> {
                       List<Employee> elist = dao.displayRecords();
                       if(elist!=null && !elist.isEmpty()){
                           System.out.println("---EMPLOYEE RECORDS---");
                           System.out.println("ID\tNAME\tEMAIL\tDEPARTMENT\tDESIGNATION\tSALARY");
                           for(Employee emp : elist){
                               System.out.println(emp);
                           }
                       }else{
                           System.out.println("no records found");
                       }
                    }

                    case 6 -> {
                        System.out.println("EXIT");
                    }

                    default -> {
                        System.out.println("invalid choice");
                    }
                }

            }while(ch!=6);
        }catch(Exception exception){
            System.err.println("error during crud operations:"+exception.getMessage());
        }
    }
}
