package com.qz.controller;

import com.qz.pojo.Manager;
import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import com.qz.service.ManagerService;
import com.qz.service.MerService;
import com.qz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@Controller
public class loginController {
    @Autowired
    @Qualifier("UserServiceImp")
    private UserService userService;
    @Autowired
    @Qualifier("MerServiceImp")
    private MerService merService;
    @Autowired
    @Qualifier("ManagerServiceImp")
    private ManagerService managerService;


    //个人和商家登录
    @RequestMapping("/normalLogin")
    @ResponseBody
    public Object normalLogin(String account,String password, String type,HttpSession session){
        System.out.println(account);
        System.out.println(password);
        System.out.println(type);

        HashMap hashMap = new HashMap();
        if(type.equals("user")){ //个人用户登录
            User user = userService.queryUserByUaccount(account);
            if(user != null){
                //用户存在
                hashMap.put("isAccountExist",true);
                if(user.getUpassword().equals(password)){
                    //登录成功
                    hashMap.put("isSuccess",true);
                    hashMap.put("isPasswordCorrect",true);
                    session.setAttribute("user_session", user);
                    return hashMap;
                }else{
                    //密码错误
                    hashMap.put("isSuccess",false);
                    hashMap.put("isPasswordCorrect",false);
                    return hashMap;
                }
            }else{
                //用户不存在
                hashMap.put("isAccountExist",false);
                hashMap.put("isSuccess",false);
                hashMap.put("isPasswordCorrect",false);
                return hashMap;
            }
        }else if(type.equals("merchant")){ //商家登录
            Merchant merchant = merService.queryMerByMaccount(account);
            if(merchant != null){
                //商家用户存在
                hashMap.put("isAccountExist",true);
                if(merchant.getMassword().equals(password)){
                    //登录成功
                    hashMap.put("isSuccess",true);
                    hashMap.put("isPasswordCorrect",true);
                    session.setAttribute("merchant_session", merchant);
                    return hashMap;
                }else{
                    //密码错误
                    hashMap.put("isSuccess",false);
                    hashMap.put("isPasswordCorrect",false);
                    return hashMap;
                }
            }
            //商家用户不存在
            hashMap.put("isAccountExist",false);
            hashMap.put("isSuccess",false);
            hashMap.put("isPasswordCorrect",false);
            return hashMap;
        }
        return null;
    }

    //管理员登录
    @RequestMapping("/adminLogin")
    @ResponseBody
    public Object adminLogin(String maname,String mapassword,HttpSession session){
        System.out.println(maname);
        System.out.println(mapassword);

        HashMap hashMap = new HashMap();
        Manager manager = managerService.queryManagerByManame(maname);
        if(manager != null){
            //用户存在
            hashMap.put("isAccountExist",true);
            if(manager.getMapassword().equals(mapassword)){
                //登录成功
                hashMap.put("isSuccess",true);
                hashMap.put("isPasswordCorrect",true);
                session.setAttribute("manager_session",manager);
                return hashMap;
            }else{
                //密码错误
                hashMap.put("isSuccess",false);
                hashMap.put("isPasswordCorrect",false);
                return hashMap;
            }
        }else{
            //用户不存在
            hashMap.put("isAccountExist",false);
            hashMap.put("isSuccess",false);
            hashMap.put("isPasswordCorrect",false);
            return hashMap;
        }
    }

    //管理员商家详情跳转
    @RequestMapping("/adminOneMerchant")
    @ResponseBody
    public Object adminOneMerchant(int mid, HttpSession session) {
        Merchant merchant = merService.queryMerById(mid);
        session.setAttribute("merchant_session", merchant);
        System.out.println(merchant);
        HashMap hashMap = new HashMap();
        hashMap.put("isSuccess",true);
        return hashMap;
    }

    //管理员用户详情跳转
    @RequestMapping("/adminOneUser")
    @ResponseBody
    public Object adminOneUser(int uid, HttpSession session) {
        User user = userService.queryUserById(uid);
        session.setAttribute("user_session", user);
        HashMap hashMap = new HashMap();
        hashMap.put("isSuccess",true);
        return hashMap;
    }
}
