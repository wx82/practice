package com.qz.service;

import com.qz.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {
    Integer addcomment(Comment cm);
    Integer updatecomment(Comment cm);
    Integer delcomment(@Param("cid") Integer id) ;
    Integer delMerComment(@Param("cid") Integer id);
    List<Comment> queryAllCommentByMid(@Param("mid") Integer id);
}
