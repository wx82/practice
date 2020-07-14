package com.qz.service;

import com.qz.pojo.Mpics;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MpicsService {
    int addMpic(MultipartFile file, Mpics mp, ModelMap map);
    int delMpic(int id);
    List<Mpics> queryAllMerById(int id);
}
