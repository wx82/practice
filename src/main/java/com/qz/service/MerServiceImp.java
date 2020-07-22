package com.qz.service;

import com.qz.dao.merMapper;
import com.qz.pojo.Merchant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MerServiceImp implements MerService{
    //service调dao层
//    @Autowired
//    @Qualifier("merMapper")
    private merMapper mermapper;

    public void setMermapper(merMapper mermapper) {
        this.mermapper = mermapper;
    }

    public Integer addMer(Merchant m) {
        return mermapper.addMer(m);
    }
    public Integer addMblicense(CommonsMultipartFile upload, HttpSession session, Merchant m){
        String fileName = uploadPic(upload, session);  //上传文件
        m.setMlicense(fileName);
        return mermapper.addMblicense(m);
    }
    public Integer updateLogo(CommonsMultipartFile upload, HttpSession session, Merchant m) {
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("/mlogo");
        String fileName = uploadPic2(upload, session,realPath);  //上传文件
        m.setMlogo(fileName);
        return mermapper.updateLogo(m);
    }


    public Integer delMerById(Integer id) {
        return mermapper.delMerById(id);
    }

    public Integer delMerById(int id) {
        return mermapper.delMerById(id);
    }


    public Integer updateMerBasic(Merchant m) {
        System.out.println("======执行Servuce修改商家基本信息==========");
        System.out.println(mermapper.updateMerBasic(m));
        return mermapper.updateMerBasic(m);
    }

    public Integer updateMerInfor(Merchant m) {
        return mermapper.updateMerInfor(m);
    }

    public Integer updateMerD(Merchant m) {
        return mermapper.updateMerD(m);
    }

    public Integer updateMerWel(Merchant m) {
        return mermapper.updateMerWel(m);
    }

    public Integer updateMerPhone(Merchant m) {
        return mermapper.updateMerPhone(m);
    }

    public Integer updateMerPsw(Merchant m) {
        return mermapper.updateMerPsw(m);
    }

    public Merchant queryMerById(Integer id) {
        return mermapper.queryMerById(id);
    }

    public List<Merchant> queryAllMer() {
        return mermapper.queryAllMer();
    }
    private String uploadPic2(CommonsMultipartFile upload, HttpSession session,String realPath){
        /* 上传图片 */
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
    public Merchant queryMerByMaccount(String maccount){return mermapper.queryMerByMaccount(maccount);}
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
    public void addMerchant(Merchant merchant){mermapper.addMerchant(merchant);}

    public List<Merchant> queryMerchantByMname(String mname){return mermapper.queryMerchantByMname(mname);};

    public void deleteMerchantById(int mid){ mermapper.deleteMerchantById(mid);};
}
