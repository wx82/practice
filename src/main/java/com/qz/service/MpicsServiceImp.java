package com.qz.service;

import com.qz.dao.mpicsMapper;
import com.qz.pojo.Mpics;
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

@Service("MpicsServiceImp")
public class MpicsServiceImp implements MpicsService {
    public void setMpicsMapper(com.qz.dao.mpicsMapper mpicsMapper) {
        this.mpicsMapper = mpicsMapper;
    }

    private mpicsMapper mpicsMapper;

    public Integer addMpic(CommonsMultipartFile upload, HttpSession session, Mpics m) {
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("/mpics");
        String fileName = uploadPic(upload, session,realPath);  //上传文件
        m.setMpaddr("/mpics/"+fileName);
        return mpicsMapper.addMpic(m);
    }
    public Integer delMpic(Integer mpid) {
        return mpicsMapper.delMpic(mpid);
    }

    public List<Mpics> queryAllMerById(Integer mid) {
        return mpicsMapper.queryAllMerById(mid);
    }
    /* 上传文件 */
    private String uploadPic(CommonsMultipartFile upload, HttpSession session,String realPath){
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
        System.out.println(uploadPath.getPath());
        System.out.println(uploadPath.getAbsolutePath());
        try {
            System.out.println(uploadPath.getCanonicalPath());
        } catch (IOException e) {
            e.printStackTrace();
        }
        //开始上传
        try {
            upload.transferTo(uploadPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }
}
