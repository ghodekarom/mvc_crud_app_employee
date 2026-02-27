package com.myproject.crudapp.model.dao;

import com.myproject.crudapp.model.entity.User;

public interface UserDAO {

    void register(User user);
    User login(String username,String userpassword);
    boolean exists(String username);
}
