package com.qz.service;

import com.qz.pojo.User;

import java.util.HashMap;
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
    //查找用户密码
    String queryPasswd(Integer id);
    //查询所有用户
    List<User> queryAllUser();
    //修改手机号
    int updatePhone(User user);
    //passwd
//    int updatePasswd(User user);
//    int updatePasswd(Integer id, String newpasswd);
    int updatePasswd(HashMap map);
    //根据注册手机号来查询用户
    User queryUserByUphone(String uphone);
}
