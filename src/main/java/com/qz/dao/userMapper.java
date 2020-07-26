package com.qz.dao;

import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface userMapper {
    //增加用户
    int addUser(User m);
    //删除用户
    int delUserById(@Param("uid") int id);
    //修改用户
    int updateUser(User m);
    //修改用户技能
    int updateUserSkill(User m);
    //修改用户介绍
    int updateUserIntro(User m);
    //查找用户
    User queryUser(User user);
    //查找用户密码
    String queryPassword(Integer id);
    //查询所有用户
    List<User> queryAllUser();
    //修改手机
    int updatePhone(User user);
    //修改密码
//    int updatePasswd(User user);
//    int updatePasswd(Integer id, String newpasswd);
    int updatePassword(HashMap map);
    //根据用户名来查询用户
    User queryUserByUaccount(String uaccount);
    //注册时添加用户
    void addUser2(User user);

    //根据id查询用户
    User queryUserById(int uid);
    //根据uname查询用户列表
    List<User> queryUserByUname(String uname);
    //根据id删除用户
    void deleteUserById(int uid);
    //添加头像
    Integer addUpic(User user);
}
