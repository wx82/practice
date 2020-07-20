package com.qz.dao;

import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface merMapper {
    //增加商家,注册时使用
    Integer addMer(Merchant m);
    //上传营业执照
    Integer addMblicense(Merchant m);
    //删除商家
    Integer delMerById(@Param("mid") int id);

    Integer updateMerBasic(Merchant m);
    Integer updateMerInfor(Merchant m);
    Integer updateMerWel(Merchant m);
    Integer updateMerD(Merchant m);

    //修改手机号
    Integer updateMerPhone(Merchant m);
    //修改密码
    Integer updateMerPsw(Merchant m);

    //查找商家
    Merchant queryMerById(@Param("mid") Integer id);  //param就是在mapper。xml文件中使用的

    //    查找商家的所有展示图片
    Mpics getMerPics(@Param("mid") Integer id);
    //

    //查询所有商家
    List<Merchant> queryAllMer();

    //    //修改商家
//    int updateMer(Merchant m,@Param("mid") int id);

    //    int updateMerBasic(@Param("mid") int id,String mname,String mscale,String maddcity,String maddcounty,String maddtown,String maddress);
//    int updateMerInfor(Merchant m,@Param("mid") int id);
//    int updateMerD(Merchant m,@Param("mid") int id);
////
    //根据用户名查找商家
    Merchant queryMerByMaccount(String maccount);

    void addMerchant(Merchant merchant);
}
