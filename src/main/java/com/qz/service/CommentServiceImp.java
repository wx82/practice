package com.qz.service;

import com.qz.dao.commentMapper;
import com.qz.pojo.Comment;

import java.util.List;

public class CommentServiceImp implements CommentService {
    private commentMapper commentMapper;
    public int addcomment(Comment cm) {
        return commentMapper.addcomment(cm);
    }
    //商家回复
    public int updatecomment(Comment cm) {
        return commentMapper.updatecomment(cm);
    }

    public int delcomment(int id) {
        return commentMapper.delcomment(id);
    }

    public List<Comment> queryAllComment() {
        return commentMapper.queryAllComment();
    }
}
