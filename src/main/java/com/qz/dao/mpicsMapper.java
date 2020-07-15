package com.qz.dao;

import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface mpicsMapper {
    Integer addMpic(Mpics mp);
    Integer delMpic(@Param("mpid") Integer id);
    List<Mpics> queryAllMerById(Integer id);
}
