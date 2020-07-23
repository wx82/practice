package com.qz.service;

import com.qz.pojo.Mpics;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MpicsService {
    Integer addMpic(CommonsMultipartFile upload, HttpSession session, Mpics m);
    Integer delMpic(Integer mpid);
    List<Mpics> queryAllMerById(Integer mid);
}
