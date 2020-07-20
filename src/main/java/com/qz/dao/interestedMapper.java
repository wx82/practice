package com.qz.dao;

import com.qz.pojo.Comment;
import com.qz.pojo.Interested;
import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface interestedMapper {
    Integer setInterested(Interested interested);
    Integer delInterested(Interested interested);
    List<Interested> queryAllInterestedByUid(User user);
    Integer queryAllInterestedNum(User user);
}
