package com.qz.dao;

import com.qz.pojo.Comment;


import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface commentMapper {
    Integer addcomment(Comment cm);
    Integer comment(Comment comment) ;
    Integer updatecomment(Comment cm);
    Integer delcomment(@Param("cid") Integer id);
    Integer delMerC(@Param("cid") Integer id);
    Integer delMerComment(@Param("cid") Integer id);
    List<Comment> queryAllCommentByMid(@Param("mid") Integer id);
    List<Comment> queryAllCommentByUid(User user);

}
