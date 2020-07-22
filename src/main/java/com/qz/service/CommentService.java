package com.qz.service;

import com.qz.pojo.Comment;
import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface CommentService {
    Integer addcomment(Comment cm);
    Integer updatecomment(Comment cm);
    Integer comment(Comment comment);
    Integer delcomment(Comment comment) ;
    Integer delMerComment(@Param("cid") Integer id);
    Integer delMerC(Integer cid);
    List<HashMap> queryAllCommentByUid(User user);
    List queryAllCommentByMid(@Param("mid") Integer id);
    List queryAllComments(Integer id);

}
