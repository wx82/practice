package com.qz.service;

import com.qz.dao.jobMapper;
import com.qz.pojo.Job;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImp implements JobService{
    //service调dao层
    public void setJobMapper(jobMapper jobMapper) {
        this.jobMapper = jobMapper;
    }
    @Autowired
    @Qualifier("jobMapper")
    private jobMapper jobMapper;
    public Integer addJob(Job job) {
        return jobMapper.addJob(job);
    }

    public Integer updateJob(Job job) {
        return jobMapper.updateJob(job);
    }

    public Integer delJob(Integer id) {
        return jobMapper.delJob(id);
    }

    //一个商家的所有岗位
    public List<Job> queryAllJobByMid(Integer mid) {
        return jobMapper.queryAllJobByMid(mid);
    }
    //某一个岗位的信息
    public Job queryJobByJid(Integer jid) {
        System.out.println("jobService获取的jid："+jid);
        Job j = jobMapper.queryJobByJid(jid);
        return j;
    }

    //所有岗位信息
    public List<Job> queryAllJob(){return jobMapper.queryAllJob();}

    public List<Job> queryJobBycity(Job job) {
        return jobMapper.queryJobBycity(job);
    }
    public List<Job> queryJobByitems(Job job) {
        return jobMapper.queryJobByitems(job);
    }
    public List<Job> queryJobBytime(Job job){
        return jobMapper.queryJobBytime(job);
    }

}
