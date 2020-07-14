package com.qz.service;

import com.qz.pojo.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JobService {
    Integer addJob(Job job);
    Integer updateJob(Job job);
    Integer delJob(@Param("jid") Integer id);
    List<Job> queryAllJobByMid(@Param("mid") Integer id);
    Job queryJobByJid(@Param("jid") Integer id);
    List<Job> queryAllJob();
}
