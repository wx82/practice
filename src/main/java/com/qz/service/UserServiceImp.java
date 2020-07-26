package com.qz.service;

import com.qz.dao.userMapper;
import com.qz.pojo.User;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

    //添加头像
    public Integer addUpic(CommonsMultipartFile upload, HttpSession session, User user){
        String fileName = uploadPic(upload, session);  //上传文件
        user.setUpic(fileName);
        return usermapper.addUpic(user);
    }
    /* 上传文件 */
    private String uploadPic(CommonsMultipartFile upload, HttpSession session){
        /* 上传图片 */
        //确定上传路径,获得服务器的路径
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("/upload");
        //变成程序中的路径
        File uploadPath = new File(realPath);
        if(!uploadPath.exists()){
            uploadPath.mkdirs();   //若文件夹不存在则创建文件夹
        }
        //确定最终上传路径
        String uuid = UUID.randomUUID().toString();  //使用随机数
        String str = upload.getOriginalFilename();  //获得文件后缀
        String str1=str.substring(0, str.indexOf("."));
        String str2=str.substring(str1.length(), str.length());
        String fileName = uuid.replace("-", "") + str2;  //设置文件名
        uploadPath = new File(uploadPath + "/" + fileName);
        //开始上传
        try {
            upload.transferTo(uploadPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
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
