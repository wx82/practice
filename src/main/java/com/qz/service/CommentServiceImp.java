package com.qz.service;

import com.qz.dao.commentMapper;
import com.qz.dao.merMapper;
import com.qz.dao.userMapper;
import com.qz.pojo.Comment;

import java.util.HashMap;
import java.util.List;
import com.qz.dao.commentMapper;
import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImp implements CommentService {
    private userMapper userMapper;
    private merMapper mermapper;
    public void setCommentMapper(commentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }
    public void setUserMapper(com.qz.dao.userMapper userMapper) {
        this.userMapper = userMapper;
    }

    public void setMermapper(merMapper mermappper) {
        this.mermapper = mermappper;
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
    //    商家删除自己评论
    public Integer delMerComment(Integer id) {
        return commentMapper.delMerComment(id);
    }



    public List<Comment> queryAllCommentByUid(User user) {
        return commentMapper.queryAllCommentByUid(user);
    }
    //查看所有评论信息，无头像
    public List queryAllCommentByMid(Integer id) {
        List<Comment> comments = commentMapper.queryAllCommentByMid(id);
        List list = null;
        for(int i=0;i<comments.size();i++){
            Integer uid = comments.get(i).getUid();
            Integer mid = comments.get(i).getMid();
            String e = comments.get(i).getEinfor();
            String en = comments.get(i).getEminfor();
            User user = new User();
            user.setUid(id);
            User user1 = userMapper.queryUser(user);
            String uname = user1.getUname();
            Merchant m = mermapper.queryMerById(mid);
            String mname = m.getMname();
            HashMap comment1 = new HashMap();
            comment1.put("einfor",e);
            comment1.put("eminfor",en);
            comment1.put("uname",uname);
            comment1.put("mname",mname);
            list.add(comment1);
        }
        return list;
    }

    public List queryAllComments(Integer id){
        List<Comment> comments = commentMapper.queryAllCommentByMid(id);
        List list = null;
        for(int i=0;i<comments.size();i++){
            Integer uid = comments.get(i).getUid();
            Integer mid = comments.get(i).getMid();
            String e = comments.get(i).getEinfor();
            String en = comments.get(i).getEminfor();
            User user = new User();
            user.setUid(id);
            User user1 = userMapper.queryUser(user);
            String uname = user1.getUname();
            String upic = user1.getUpic();
            Merchant m = mermapper.queryMerById(mid);
            String mname = m.getMname();
            String logo = m.getMlogo();
            HashMap comment1 = new HashMap();
            comment1.put("einfor",e);
            comment1.put("eminfor",en);
            comment1.put("uname",uname);
            comment1.put("mname",mname);
            comment1.put("upic",upic);
            comment1.put("logo",logo);
            list.add(comment1);
        }
        return list;
    }
}
