package com.myproject.crudapp.model.dao;

import com.myproject.crudapp.model.entity.User;
import com.myproject.crudapp.model.utils.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImp implements UserDAO{


    @Override
    public void register(User user) {
         try(Connection c = DBConnect.fetchConnection();
             PreparedStatement psregister = c.prepareStatement("insert into users(name,username,userpassword) values(?,?,?)")){

             psregister.setString(1,user.getName());
             psregister.setString(2, user.getUsername());
             psregister.setString(3, user.getUserpassword());

             psregister.executeUpdate();

         }catch(SQLException se){
             throw new EmployeeDAOExcep("error during register"+se.getMessage(),se);
         }
    }

    @Override
    public User login(String username, String userpassword) {
       User user = null;
        try(Connection c = DBConnect.fetchConnection();
        PreparedStatement pslogin = c.prepareStatement("select * from users where username=? and userpassword=?")){

            pslogin.setString(1,username);
            pslogin.setString(2,userpassword);

           try(ResultSet rs = pslogin.executeQuery()){

               if(rs.next()){
                   user = new User(rs.getString(1),rs.getString(2),rs.getString(3));
               }

           }catch(SQLException se){
               throw new EmployeeDAOExcep("error during login"+se.getMessage(),se);
           }

        }catch(SQLException se){
            throw new EmployeeDAOExcep("error during login"+se.getMessage(),se);
        }
        return user;
    }

    @Override
    public boolean exists(String username) {
       boolean flag=false;

       try(Connection c = DBConnect.fetchConnection();
       PreparedStatement psexists = c.prepareStatement("select * from users where username=?");
       ResultSet rs = psexists.executeQuery()){

           if(rs.next()){
               flag = true;
           }

       }catch(SQLException se){
           throw new EmployeeDAOExcep("error during searching user"+se.getMessage(),se);
       }
       return flag;
    }
}
