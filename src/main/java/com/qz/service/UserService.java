package com.qz.service;

import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

public interface UserService {
    //增加用户
    int addUser(User m);
    //删除用户
    int delUserById(int id);
    //修改用户信息
    int updateUser(User m);
    //添加头像
    Integer addUpic(CommonsMultipartFile upload, HttpSession session, User user);
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
    //修改手机号
    int updatePhone(User user);
    //passwd
//    int updatePasswd(User user);
//    int updatePasswd(Integer id, String newpasswd);
    int updatePassword(HashMap map);
    //根据用户名来查询用户
    User queryUserByUaccount(String uaccount);
    //注册时添加用户
    void addUser2(User user);
    //通过id查询用户
    User queryUserById(int uid);
    //通过uname查询用户
    List<User> queryUserByUname(String uname);
    //通过id删除用户
    void deleteUserById(int uid);
}
