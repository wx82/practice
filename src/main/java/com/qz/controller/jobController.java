package com.qz.controller;

import com.qz.pojo.Job;
import com.qz.service.JobService;
import com.qz.service.JobServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/job")

public class jobController {
    //    //controller层调用service层
    @Autowired
//    //括号中填写-service中的beanID
    @Qualifier("JobServiceImp")
    private JobService jobService = new JobServiceImp();

    //查询商家展示
    @RequestMapping("/alljob")
    public String list(Model model) {
        List<Job> list = jobService.queryAllJob();
        model.addAttribute("list", list);
        return "alljob";
    }
    @RequestMapping("/getjobs")
    @ResponseBody
    public Object queryAllJob() {
//        List<Job> list = jobService.queryAllJob();
        HashMap jobs = new HashMap();
        jobs.put("jobs",jobService.queryAllJob());

        return jobs;
    }
    @RequestMapping("/getjob")
    @ResponseBody
    public Object queryJob(@RequestBody Job job) {
        Job info = jobService.queryJob(job);
        return info;
    }
}

