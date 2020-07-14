package com.qz.service;

import com.qz.pojo.User;

import java.util.List;

public interface UserService {
    //增加用户
    int addUser(User m);
    //删除用户
    int delUserById(int id);
    //修改用户信息
    int updateUser(User m);
    //查找用户
    User queryUser(User user);
    //查询所有用户
    List<User> queryAllUser();
    //修改手机号
    int updatePhone(User user);
    //passwd
    int updatePasswd(User user);
}
