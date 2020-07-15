package com.qz.service;

import com.qz.dao.interestedMapper;
import com.qz.pojo.Comment;
import com.qz.pojo.Interested;
import com.qz.pojo.User;

import java.util.List;

public class InterestedServiceImp implements InterestedService {
    public void setInterestedMapper(interestedMapper interestedMapper) {
        this.interestedMapper = interestedMapper;
    }

    private interestedMapper interestedMapper;
    public Integer setInterested(Interested interested){
        return interestedMapper.setInterested(interested);
    }
    public Integer delInterested(Interested interested) {
        return interestedMapper.delInterested(interested);
    }
    public List<Comment> queryAllInterestedByUid(User user) {
        return interestedMapper.queryAllInterestedByUid(user);
    }
}
