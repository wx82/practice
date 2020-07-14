package com.qz.dao;

import com.qz.pojo.Comment;


import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface commentMapper {
    int addcomment(Comment cm);
    int updatecomment(Comment cm);
    int delcomment(@Param("cid") int id) ;
    List<Comment> queryAllComment();

}
