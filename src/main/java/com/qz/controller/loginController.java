package com.qz.controller;

import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import com.qz.service.MerService;
import com.qz.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class loginController {
    @Autowired
    @Qualifier("UserServiceImp")
    private UserService userService;
    @Qualifier("MerServiceImp")
    private MerService merService;

    //个人和商家密码登录
    @RequestMapping("/passwordLogin")
    @ResponseBody
    public Object passwordLogin(String phone,String password, String type,HttpSession session){
        System.out.println(phone);
        System.out.println(password);
        System.out.println(type);
        //个人用户登录
        if(type=="user"){
            User user = userService.queryUserByUphone(phone);
            if(user != null){
                //登录成功
                if(user.getUphone().equals(phone)){
                    session.setAttribute("user_session", user);
                    return user;
                }else{
                    //密码错误
                    return user;
                }
            }
            //用户不存在
            HashMap hashMap = new HashMap();
            hashMap.put("isExist",false);
            return hashMap;
        }else{ //商家登录
            Merchant merchant = merService.queryMerByMrphone(phone);
            if(merchant != null){
                //登录成功
                if(merchant.getMrphone().equals(phone)){
                    session.setAttribute("merchant_session", merchant);
                    return merchant;
                }else{
                    //密码错误
                    return merchant;
                }
            }
            //用户不存在
            HashMap hashMap = new HashMap();
            hashMap.put("isExist",false);
            return hashMap;
        }
    }
}
