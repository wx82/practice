package com.qz.service;

import com.qz.dao.merMapper;
import com.qz.pojo.Merchant;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MerServiceImp implements MerService{
    //service调dao层
    private merMapper mermapper;

    public void setMermapper(merMapper mermapper) {
        this.mermapper = mermapper;
    }

    public Integer addMer(Merchant m) {
        return mermapper.addMer(m);
    }

    public Integer addMblicense(MultipartFile file, Merchant m, ModelMap map) {
        //基础路径
        String filePath = "";
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = UUID.randomUUID() + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return mermapper.addMblicense(m);
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
}
