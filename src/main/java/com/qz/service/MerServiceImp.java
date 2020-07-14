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

    public int addMer(Merchant m) {
        return mermapper.addMer(m);
    }

    public int addMblicense(MultipartFile file, Merchant m, ModelMap map) {
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

    public int delMerById(int id) {
        return mermapper.delMerById(id);
    }

//    public int updateMer(Merchant m,int id) {
//        return mermapper.updateMer(m,id);
//    }

    public int updateMerBasic(Merchant m) {
        return mermapper.updateMerBasic(m);
    }

    public int updateMerInfor(Merchant m) {
        return mermapper.updateMerInfor(m);
    }

    public int updateMerD(Merchant m) {
        return mermapper.updateMerD(m);
    }

    public int updateMerPhone(Merchant m) {
        return mermapper.updateMerPhone(m);
    }

    public int updateMerPsw(Merchant m) {
        return mermapper.updateMerPsw(m);
    }

    public Merchant queryMerById(int id) {
        return mermapper.queryMerById(id);
    }

    public List<Merchant> queryAllMer() {
        return mermapper.queryAllMer();
    }
}
