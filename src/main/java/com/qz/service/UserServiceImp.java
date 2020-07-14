package com.qz.service;

import com.qz.dao.userMapper;
import com.qz.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImp implements UserService{
    //service调dao层
    private userMapper usermapper;

    public void setUsermapper(userMapper usermapper) {
        this.usermapper = usermapper;
    }

    public int addUser(User m) {
        return usermapper.addUser(m);
    }

    public int delUserById(int id) {
        return usermapper.delUserById(id);
    }

    public int updateUser(User m) {
        return usermapper.updateUser(m);
    }

    public User queryUser(User user) {
        return usermapper.queryUser(user);
    }

    public List<User> queryAllUser() {
        return usermapper.queryAllUser();
    }

    public int updatePhone(User user) {
        return usermapper.updatePhone(user);
    }
    public int updatePasswd(User user){
        return usermapper.updatePasswd(user);
    }
}
