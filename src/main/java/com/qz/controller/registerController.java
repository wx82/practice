package com.qz.controller;

import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import com.qz.service.MerService;
import com.qz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class registerController {
    @Autowired
    @Qualifier("UserServiceImp")
    private UserService userService;
    @Autowired
    @Qualifier("MerServiceImp")
    private MerService merService;


    //个人和商家用户注册
    @RequestMapping("/register")
    @ResponseBody
    public Object register(String account,String password, String type){
        System.out.println(account);
        System.out.println(password);
        System.out.println(type);

        HashMap hashMap = new HashMap();
        if(type.equals("user")){ //个人用户注册
            User user = userService.queryUserByUaccount(account);
            if(user != null){
                //用户存在
                hashMap.put("isAccountExist",true);
                hashMap.put("isSuccess",false);
                return hashMap;
            }else{
                //用户不存在
                User user1 = new User();
                user1.setUaccount(account);
                user1.setUpassword(password);
                userService.addUser2(user1);
                hashMap.put("isAccountExist",false);
                hashMap.put("isSuccess",true);
                return hashMap;
            }
        }else if(type.equals("merchant")){ //商家注册
            Merchant merchant = merService.queryMerByMaccount(account);
            if(merchant != null){
                //商家用户存在
                hashMap.put("isAccountExist",true);
                hashMap.put("isSuccess",false);
                return hashMap;
            }else{
                //商家用户不存在
                Merchant merchant1 = new Merchant();
                merchant1.setMaccount(account);
                merchant1.setMpassword(password);
                merService.addMerchant(merchant1);
                hashMap.put("isAccountExist",false);
                hashMap.put("isSuccess",true);
                return hashMap;
            }
        }
        return null;
    }
}
