package com.qz.service;

import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import javax.servlet.http.HttpSession;
import java.util.List;

public interface MerService {
    //增加商家
    Integer addMer(Merchant m);
    //上传营业执照
    Integer addMblicense(CommonsMultipartFile upload, HttpSession session, Merchant m);
 //上传logo
 Integer updateLogo(CommonsMultipartFile upload, HttpSession session, Merchant m);
   // public Integer addMblicense(Merchant m);
//    Integer addMblicense(MultipartFile file, Merchant m, ModelMap map);
    //删除商家
    Integer delMerById(Integer id);
    //修改商家
    Integer updateMerBasic(Merchant m);
    Integer updateMerInfor(Merchant m);
    Integer updateMerD(Merchant m);
    //修改优势福利
    Integer updateMerWel(Merchant m);
    //修改手机号
    Integer updateMerPhone(Merchant m);
    //修改密码
    Integer updateMerPsw(Merchant m);
    //查找商家
    Merchant queryMerById(Integer id);
    //查询所有商家
    List<Merchant> queryAllMer();
    //根据账户名查询商家
    Merchant queryMerByMaccount(String maccount);
    //注册时添加商家用户
    void addMerchant(Merchant merchant);
    //通过mname查询用户
    List<Merchant> queryMerchantByMname(String mname);
    //通过id删除用户
    void deleteMerchantById(int mid);
 //注册后填写信息
 Integer addInfor(Merchant m);
}
