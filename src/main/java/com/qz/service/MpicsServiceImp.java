package com.qz.service;

import com.qz.dao.mpicsMapper;
import com.qz.pojo.Mpics;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MpicsServiceImp implements MpicsService {
    public void setMpicsMapper(com.qz.dao.mpicsMapper mpicsMapper) {
        this.mpicsMapper = mpicsMapper;
    }

    private mpicsMapper mpicsMapper;

    public int addMpic(MultipartFile file, Mpics mp, ModelMap map){
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
        //保存到数据库
        mp.setMpaddr(newFileName);
        return mpicsMapper.addMpic(mp);
    }

    public int delMpic(int id) {
        return mpicsMapper.delMpic(id);
    }

    public List<Mpics> queryAllMerById(int id) {
        return mpicsMapper.queryAllMerById(id);
    }
}
