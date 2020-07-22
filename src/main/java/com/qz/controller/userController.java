package com.qz.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qz.pojo.*;
import com.qz.pojo.User;
import com.qz.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/user")

public class userController {
    //    //controller层调用service层
    @Autowired
//    //括号中填写-service中的beanID
    @Qualifier("UserServiceImp")
    private UserService userService = new UserServiceImp();
    //    //controller层调用service层
    @Autowired
//    //括号中填写-service中的beanID
    @Qualifier("CommentServiceImp")
    private CommentService commentService = new CommentServiceImp();
    //    //controller层调用service层
    @Autowired
//    //括号中填写-service中的beanID
    @Qualifier("InterestedServiceImp")
    private InterestedService interestedService = new InterestedServiceImp();

    //查询个人展示
    @RequestMapping("/alluser")
    public String list(Model model) {
        List<User> list = userService.queryAllUser();
        model.addAttribute("list", list);
        return "alluser";
//        return "testpage";
    }
    @RequestMapping("/getusers")
    @ResponseBody
    public Object queryAllUser() {
        List<User> list = userService.queryAllUser();
//        User list = userService.queryUserById(1);

        HashMap users = new HashMap();
        users.put("users",userService.queryAllUser());

//        Gson gson = new Gson();
//        String json = gson.toJson(list);
//        return json;
        return users;
    }
    @RequestMapping("/getuser")
    @ResponseBody
    public Object queryUser(@RequestBody User user) {
        User info = userService.queryUser(user);
        return info;
    }
    //修改基本信息
    @RequestMapping("/updateuser") ///updateuser/{id}
    @ResponseBody
    public Object updateUser(User user) {
//        System.out.println("SSM接受到浏览器提交的json，并转换为User对象:"+user);
//        int res = userService.updateUser(user);
        HashMap hashMap = new HashMap();
        hashMap.put("status",userService.updateUser(user));
        return hashMap;
    }
    //修改技能
    @RequestMapping("/updateuserskill") ///updateuser/{id}
    @ResponseBody
    public Object updateUserSkill(User user) {
//        System.out.println("SSM接受到浏览器提交的json，并转换为User对象:"+user);
//        int res = userService.updateUser(user);
        HashMap hashMap = new HashMap();
        hashMap.put("status",userService.updateUserSkill(user));
        return hashMap;
    }
    //修改介绍
    @RequestMapping("/updateuserintro") ///updateuser/{id}
    @ResponseBody
    public Object updateUserIntro(User user) {
//        System.out.println("SSM接受到浏览器提交的json，并转换为User对象:"+user);
//        int res = userService.updateUser(user);
        HashMap hashMap = new HashMap();
        hashMap.put("status",userService.updateUserIntro(user));
        return hashMap;
    }
    //修改手机号
    @RequestMapping("/updatePhone")
    @ResponseBody
    public Object updatePhone(@RequestBody User user){
        HashMap hashMap = new HashMap();
        hashMap.put("status",userService.updatePhone(user));
        return hashMap;
    }
    //修改密码
    @RequestMapping("/updatepassword")
    @ResponseBody
//    public Object updatePassword(@RequestBody User user){
//        HashMap hashMap = new HashMap();
//        hashMap.put("status",userService.updatePassword(user));
//        return hashMap;
//    }
//    public Object updatePasswd(Integer uid, String upasswd, String newpasswd){
    public Object updatePassword(Integer uid, String upassword, String newpassword){
        HashMap hashMap = new HashMap();
        HashMap newinfo = new HashMap();
        newinfo.put("uid",uid);
        newinfo.put("newpassword", newpassword);
//        System.out.println(userService.queryPasswd(uid));
//        System.out.println(upasswd);
//        System.out.println(upasswd.equalsIgnoreCase(userService.queryPasswd(uid)));
        if (upassword.equalsIgnoreCase(userService.queryPassword(uid))){
            int res = userService.updatePassword(newinfo);
            if(res == 1) {
                hashMap.put("status", 0);
            }else {
                hashMap.put("status", 1);
            }
            return hashMap;
        }else {
            hashMap.put("status", 2);
            return hashMap;
        }


    }

    //评论
    @RequestMapping("/comment")
    @ResponseBody
    Integer comment(Comment comment){
        return commentService.addcomment(comment);
    }
    //删除评论
    @RequestMapping("/delComment")
    @ResponseBody
    Object delcomment(Comment comment) {
        HashMap hashMap = new HashMap();
        hashMap.put("status",commentService.delcomment(comment));
        return hashMap;
//        return commentService.delcomment(id);
    }
    //查看所有评论
    @RequestMapping("/queryAllComment")
    @ResponseBody
    Object queryAllCommentByUid(User user){
        HashMap hashMap = new HashMap();
        hashMap.put("comments",commentService.queryAllCommentByUid(user));
        return hashMap;
//        return commentService.queryAllCommentByUid(user);
    }

    //感兴趣
    @RequestMapping("/interested")
    @ResponseBody
    Object interested(Interested interested){
        Integer res = interestedService.setInterested(interested);
//        System.out.println("===============");
//        System.out.println(res);
        Integer iid = interested.getIid();
        HashMap hashMap = new HashMap();
        hashMap.put("iid",interested.getIid());
        return hashMap;
//        return iid;
    }
    //删除感兴趣
    @RequestMapping("/delinterested")
    @ResponseBody
    Object delInterested(Interested interested) {
        HashMap hashMap = new HashMap();
        hashMap.put("status",interestedService.delInterested(interested));
        return hashMap;
//        return interestedService.delInterested(interested);
    }
    //查询用户感兴趣
    @RequestMapping("/queryAllInterestedByUid")
    @ResponseBody
//    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    Object queryAllInterestedByUid(User user) {
        HashMap hashMap = new HashMap();
        hashMap.put("interested",interestedService.queryAllInterestedByUid(user));
        return hashMap;
//        return interestedService.queryAllInterestedByUid(user);
    }

    //查询用户感兴趣的数量
    @RequestMapping("/queryAllInterestedNum")
    @ResponseBody
    Object queryAllInterestedNum(User user){
        HashMap hashMap=new HashMap();
        hashMap.put("interestedNum",interestedService.queryAllInterestedNum(user));
        return hashMap;
        //returninterestedService.queryAllInterestedByUid(user);
    }

    //后台管理查看所有求职者
    @RequestMapping("/adminGetUsers")
    @ResponseBody
    public Object showUsers(){
        List<User> list = userService.queryAllUser();
        HashMap users = new HashMap();
        users.put("users",userService.queryAllUser());
        return users;
    }

    //后台管理通过id查找求职者
    @RequestMapping("/adminQueryUserById")
    @ResponseBody
    public Object queryUserById(int uid){
        System.out.println(uid);
        User user = userService.queryUserById(uid);
        System.out.println(user);
        HashMap hashmap = new HashMap();
        if(user!=null){
            //用户存在
            hashmap.put("user",user);
            hashmap.put("isExist",true);
        }else{
            //用户不存在
            hashmap.put("isExist",false);
        }
        return hashmap;
    }

    //后台管理通过uname来查找求职者
    @RequestMapping("/adminQueryUserByUname")
    @ResponseBody
    public Object queryUserByUname(String uname){
        System.out.println(uname);
        List<User> users = userService.queryUserByUname(uname);
        System.out.println(users);
        HashMap hashmap = new HashMap();
        if(!users.isEmpty()){
            //用户存在
            hashmap.put("users",users);
            hashmap.put("isExist",true);
        }else{
            //用户不存在
            hashmap.put("isExist",false);
        }
        return hashmap;
    }

    //后台管理根据id删除用户
    @RequestMapping("/adminDeleteUserById")
    @ResponseBody
    public Object deleteUserById(int uid){
        System.out.println(uid);
        userService.deleteUserById(uid);
        HashMap hashmap = new HashMap();
        hashmap.put("isSuccessful",true);
        return hashmap;
    }
}

