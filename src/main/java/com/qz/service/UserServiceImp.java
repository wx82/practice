package com.qz.service;

import com.qz.dao.userMapper;
import com.qz.pojo.User;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
    //修改用户技能
    public int updateUserSkill(User m){
        return usermapper.updateUserSkill(m);
    }
    //修改用户介绍
    public int updateUserIntro(User m){
        return usermapper.updateUserIntro(m);
    }

    public User queryUser(User user) {
        return usermapper.queryUser(user);
    }
    //查找用户密码
    public String queryPassword(Integer id){
        return usermapper.queryPassword(id);
    }

    public List<User> queryAllUser() {
        return usermapper.queryAllUser();
    }

    public int updatePhone(User user) {
        return usermapper.updatePhone(user);
    }
//    public int updatePasswd(User user){
//        return usermapper.updatePasswd(user);
//    }
//    public int updatePasswd(Integer id, String newpasswd){
//        return usermapper.updatePasswd(id, newpasswd);
//    }
    public int updatePassword(HashMap map){
    return usermapper.updatePassword(map);
}

    public User queryUserByUaccount(String uaccount){return usermapper.queryUserByUaccount(uaccount);}

    public void addUser2(User user){
        usermapper.addUser2(user);
    }

    public User queryUserById(int uid){return usermapper.queryUserById(uid);};

    public  List<User> queryUserByUname(String uname){return usermapper.queryUserByUname(uname);};

    public void deleteUserById(int uid){ usermapper.deleteUserById(uid);};
}
