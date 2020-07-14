package com.qz.service;

import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;

public interface MerService {
    //增加商家
    int addMer(Merchant m);
    //上传营业执照
    int addMblicense(MultipartFile file, Merchant m, ModelMap map);
    //删除商家
    int delMerById(int id);
    //修改商家
//    int updateMer(Merchant m,int id);
    int updateMerBasic(Merchant m);
    int updateMerInfor(Merchant m);
    int updateMerD(Merchant m);
    //修改手机号
    int updateMerPhone(Merchant m);
    //修改密码
    int updateMerPsw(Merchant m);
    //查找商家
    Merchant queryMerById(int id);
    //查询所有商家
    List<Merchant> queryAllMer();

}
