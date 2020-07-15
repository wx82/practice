package com.qz.service;

import com.qz.pojo.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JobService {
    Integer addJob(Job job);
    Integer updateJob(Job job);
    Integer delJob(Integer jid);
    List<Job> queryAllJobByMid(Integer mid);
    Job queryJobByJid(Integer jid);
    List<Job> queryAllJob();
}
