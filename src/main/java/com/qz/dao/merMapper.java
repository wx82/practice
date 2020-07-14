package com.qz.dao;

import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface merMapper {
    //增加商家,注册是使用
    int addMer(Merchant m);
    //上传营业执照
    int addMblicense(Merchant m);
    //删除商家
    int delMerById(@Param("mid") int id);
//    //修改商家
//    int updateMer(Merchant m,@Param("mid") int id);

//    int updateMerBasic(@Param("mid") int id,String mname,String mscale,String maddcity,String maddcounty,String maddtown,String maddress);
//    int updateMerInfor(Merchant m,@Param("mid") int id);
//    int updateMerD(Merchant m,@Param("mid") int id);
////
    int updateMerBasic(Merchant m);
    int updateMerInfor(Merchant m);
    int updateMerD(Merchant m);

    //修改手机号
    int updateMerPhone(Merchant m);
    //修改密码
    int updateMerPsw(Merchant m);

    //查找商家
    Merchant queryMerById(@Param("mid") int id);  //param就是在mapper。xml文件中使用的

//    查找商家的所有展示图片
    Mpics getMerPics(@Param("mid") int id);
    //

    //查询所有商家
    List<Merchant> queryAllMer();
}
