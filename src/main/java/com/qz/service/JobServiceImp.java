package com.qz.service;

import com.qz.dao.jobMapper;
import com.qz.pojo.Job;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImp implements JobService{
    //service调dao层
    public void setJobMapper(jobMapper jobMapper) {
        this.jobMapper = jobMapper;
    }

    private jobMapper jobMapper;
    public Integer addJob(Job job) {
        return jobMapper.addJob(job);
    }

    public Integer updateJob(Job job) {
        return 0;
    }

    public Integer delJob(Integer id) {
        return 0;
    }

    //一个商家的所有岗位
    public List<Job> queryAllJobByMid(Integer mid) {
        return jobMapper.queryAllJobByMid(mid);
    }
    //某一个岗位的信息
    public Job queryJobByJid(Integer jid) {
        return jobMapper.queryJobByJid(jid);
    }

    //所有岗位信息
    public List<Job> queryAllJob(){return jobMapper.queryAllJob();}
}
