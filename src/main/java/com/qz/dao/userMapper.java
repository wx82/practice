package com.qz.dao;

import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface userMapper {
    //增加用户
    int addUser(User m);
    //删除用户
    int delUserById(@Param("uid") int id);
    //修改用户
    int updateUser(User m);
    //查找用户
    User queryUser(User user);
    //查询所有用户
    List<User> queryAllUser();
    //修改手机
    int updatePhone(User user);
    //修改密码
    int updatePasswd(User user);
}
