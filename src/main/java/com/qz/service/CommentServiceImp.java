package com.qz.service;

import com.qz.dao.commentMapper;
import com.qz.pojo.Comment;

import java.util.List;
import com.qz.dao.commentMapper;
import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

public class CommentServiceImp implements CommentService {
    public void setCommentMapper(commentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    private commentMapper commentMapper;
    public Integer addcomment(Comment cm) {
        return commentMapper.addcomment(cm);
    }
    public Integer comment(Comment comment) {
        return commentMapper.addcomment(comment);
    }
    //商家回复
    public Integer updatecomment(Comment cm) {
        return commentMapper.updatecomment(cm);
    }
    //用户删除评论（包含商家回复）
    public Integer delcomment(Integer id) {
        return commentMapper.delcomment(id);
    }

    public Integer delMerComment(Integer id) {
        return commentMapper.delMerComment(id);
    }
//    商家删除自己评论

    public List<Comment> queryAllCommentByMid(Integer id) {
        return commentMapper.queryAllCommentByMid(id);
    }
    public List<Comment> queryAllCommentByUid(User user) {
        return commentMapper.queryAllCommentByUid(user);
    }
}
