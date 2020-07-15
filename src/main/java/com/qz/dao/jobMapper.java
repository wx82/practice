package com.qz.dao;

import com.qz.pojo.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface jobMapper {
    Integer addJob(Job job);
    Integer updateJob(Job job);
    Integer delJob(@Param("jid") int id);
    List<Job> queryAllJobByMid(@Param("mid") Integer id);
    Job queryJobByJid(@Param("jid") Integer id);
    List<Job> queryJobBycity(Job job);
    List<Job> queryAllJob();
    List<Job> queryJobByitems(Job job);
}
