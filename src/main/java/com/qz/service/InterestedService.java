package com.qz.service;

import com.qz.pojo.Comment;
import com.qz.pojo.Interested;
import com.qz.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface InterestedService {
    Integer setInterested(Interested interested);
    Integer delInterested(Interested interested);
    List<HashMap> queryAllInterestedByUid(User user);
    Integer queryAllInterestedNum(User user);
}
