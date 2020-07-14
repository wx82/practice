package com.qz.dao;

import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface mpicsMapper {
    int addMpic(Mpics mp);
    int delMpic(@Param("mpid") int id);
    List<Mpics> queryAllMerById(int id);
}
