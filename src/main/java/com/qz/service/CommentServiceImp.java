package com.qz.service;

import com.qz.dao.commentMapper;
import com.qz.dao.merMapper;
import com.qz.dao.userMapper;
import com.qz.pojo.Comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.qz.dao.commentMapper;
import com.qz.pojo.Merchant;
import com.qz.pojo.User;
import com.qz.pojo.oneComment;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("CommentServiceImp")
public class CommentServiceImp implements CommentService {
    @Autowired
    @Qualifier("userMapper")
    private userMapper userMapper;
    @Autowired
    @Qualifier("merMapper")
    private merMapper mermapper;
    public void setCommentMapper(commentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }
    public void setUserMapper(userMapper userMapper) {
        this.userMapper = userMapper;
    }

    public void setMermapper(merMapper mermappper) {
        this.mermapper = mermappper;
    }
    @Autowired
    @Qualifier("commentMapper")
    private commentMapper commentMapper;
    public Integer addcomment(Comment cm) {
        return commentMapper.addcomment(cm);
    }
    public Integer comment(Comment comment) {
        return commentMapper.addcomment(comment);
    }

    public Integer delMerC(Integer id) {
        System.out.println("service收到的id值："+id);
        int i = commentMapper.delMerC(id);
        System.out.println("service返回的数据："+i);
        return i;
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



    public List<HashMap> queryAllCommentByUid(User user) {
        return commentMapper.queryAllCommentByUid(user);
    }
    //查看所有评论信息，无头像
    public List<oneComment> queryAllCommentByMid(Integer id) {
        List<Comment> comments = commentMapper.queryAllCommentByMid(id);
        List<oneComment> list = new ArrayList<oneComment>();
        for(int i=0;i<comments.size();i++){
            oneComment one = new oneComment();
            Integer cid = comments.get(i).getCid();
            Integer uid = comments.get(i).getUid();
            Integer mid = comments.get(i).getMid();
            String e = comments.get(i).getEinfor();
            String en = comments.get(i).getEminfor();
            User user = new User();
            user.setUid(uid);
            User user1 = userMapper.queryUser(user);
            String uname = user1.getUname();
            Merchant m = mermapper.queryMerById(mid);
            String mname = m.getMname();
            one.setCid(cid);
            one.setEinfor(e);
            one.setEminfor(en);
            one.setMname(mname);
            one.setUname(uname);
            System.out.println(one);
//            HashMap comment1 = new HashMap();
//            comment1.put("einfor",e);
//            comment1.put("eminfor",en);
//            comment1.put("uname",uname);
//            comment1.put("mname",mname);
            list.add(one);
        }
        return list;
    }

    public List<oneComment> queryAllComments(Integer id){
        List<Comment> comments = commentMapper.queryAllCommentByMid(id);
        List<oneComment> list = new ArrayList<oneComment>();

        for(int i=0;i<comments.size();i++){
            oneComment one = new oneComment();
            Integer cid = comments.get(i).getCid();
            Integer uid = comments.get(i).getUid();
            Integer mid = comments.get(i).getMid();
            String e = comments.get(i).getEinfor();
            String en = comments.get(i).getEminfor();
            float estar = comments.get(i).getEstar();
            User user = new User();
            user.setUid(uid);
            User user1 = userMapper.queryUser(user);
            String uname = user1.getUname();
            String upic = user1.getUpic();
            Merchant m = mermapper.queryMerById(mid);
            String mname = m.getMname();
            String logo = m.getMlogo();
            one.setCid(cid);
            one.setEinfor(e);
            one.setEminfor(en);
            one.setMname(mname);
            one.setUname(uname);
            one.setMlogo(logo);
            one.setUpic(upic);
            list.add(one);
        }

        return list;
    }
}
