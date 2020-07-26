package com.qz.service;

import com.qz.pojo.Mpics;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MpicsService {
    String addMpic1(MultipartFile file, Mpics mp, ModelMap map);
    Integer addMpic(MultipartFile file, Mpics mp, ModelMap map);
    Integer delMpic(Integer mpid);
    List<Mpics> queryAllMerById(Integer mid);
}
