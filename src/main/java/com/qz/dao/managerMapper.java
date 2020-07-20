package com.qz.dao;

import com.qz.pojo.Manager;

public interface managerMapper {
    //根据用户名查找管理员
    Manager queryManagerByManame(String maname);
}
