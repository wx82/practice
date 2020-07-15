package com.qz.controller;

import com.qz.pojo.Comment;
import com.qz.pojo.Job;
import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import com.qz.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/merchant")

public class merController {
    //controller层调用service层
    @Autowired
    //括号中填写-service中的beanID
    @Qualifier("MerServiceImp")
    private MerService merService = new MerServiceImp();
    //查询商家展示
    @RequestMapping("/allmer")
    @ResponseBody
    public String list(Model model){
        List<Merchant> list = merService.queryAllMer();
        model.addAttribute("list",list);
        return "allmer";
    }
    //所有商家所有信息
    @RequestMapping("/allmerTT")
    @ResponseBody
    List<Merchant> queryAllMer(){
        return merService.queryAllMer();
    }

//    跳转到某个页面
//    @RequestMapping("/to")
//    public String to(){
//        return "allmer";
//    }
    //添加商铺
//    public String addMer(Merchant m){
//        System.out.println("添加商铺=》"+m);
//        merService.addMer(m);
//        return "redirect:/merchant/allmer";//重定向到allmer请求或者直接写return "allmer";
//    }
    //跳转到修改界面
//    public String edit(int id,Model model){
//        Merchant m = merService.queryMerById(id);
//        model.addAttribute("Merchant",m);//这个Merchant是前端取值的时候用 在表单中添加value="${Merchant.属性}" 用于填写编辑界面的默认子
//        return "updateMer";
//    }
    //修改商铺信息
//    @RequestMapping("/updateMer")
//    public String updateMer(Merchant m){
//        System.out.println("updateMer="+m);
//        int i = merService.updateMer(m);
//        if(i>0){
//            System.out.println("添加成功"+m);
//        }
////        List<Merchant>
//        return "redirect:/merchant/allmer";
//    }
    //修改商铺基本信息
    @RequestMapping(value="/updateMerBasic",method = RequestMethod.POST)
    @ResponseBody
    public Integer updateMerBasic(@RequestBody Merchant m){
        return merService.updateMerBasic(m);
    }
    @RequestMapping("/updateMerInfor")
    @ResponseBody
    Integer updateMerInfor(Merchant m){
        return merService.updateMerInfor(m);
    }
    @RequestMapping("/updateMerD")
    @ResponseBody
    Integer updateMerD(Merchant m){
        return merService.updateMerD(m);
    }
    //修改手机号
    @RequestMapping("/updateMerPhone")
    Integer updateMerPhone(Merchant m){
        //先调用获取验证码，返回验证码
        //再输入手机号，返回验证码成功后
        //存入数据库
        return merService.updateMerPhone(m);
    }
    //修改密码
    @RequestMapping("/updateMerPsw")
    Integer updateMerPsw(Merchant m){
        //先获取验证码，返回验证码
        //存入数据库
        return merService.updateMerPsw(m);
    }
    //===========商铺展示图图片操作=================
    @Autowired
    //括号中填写-service中的beanID
    @Qualifier("MpicsServiceImp")
    private MpicsService mpicsService = new MpicsServiceImp();
    //1、增加商铺展示图片
    @RequestMapping("/addMpic")
    public int addMpic(MultipartFile file, Mpics mp, ModelMap map){
        return mpicsService.addMpic(file, mp, map);
    }
    @RequestMapping("/delMpic")
    Integer delMpic(Integer id){
        return mpicsService.delMpic(id);
    }

    @RequestMapping("/queryAllMerById")
    @ResponseBody
    List<Mpics> queryAllMerById(Integer id){
        return mpicsService.queryAllMerById(id);
    }

    ///------------------------------------------------------------------------------
    //=========================评论相关===================================
    @Autowired
    //括号中填写-service中的beanID
    @Qualifier("CommentServiceImp")
    private CommentService com = new CommentServiceImp();
    //用户评论
    @RequestMapping("/addcomment")
    Integer addcomment(Comment cm){
        return com.addcomment(cm);
    }
    //商家回复评论
    @RequestMapping("/updatecomment")
    Integer updatecomment(Comment cm){
        return com.updatecomment(cm);
    }

    //删除商家评论
    @RequestMapping("/delMerComment")
    Integer delMercomment(@Param("cid") Integer id) {
        return com.delcomment(id);
    }
    //查看该商家所有评论,无头像
    @RequestMapping("/queryAllMerComment")

    public List queryAllCommentByMid(Integer mid){
        List comments = com.queryAllCommentByMid(mid);
        return comments;
    }
    //查看该商家所有评论,有头像
    @RequestMapping("/allComment")

    public List allCommentByMid(Integer mid){
        List comments = com.queryAllComments(mid);
        return comments;
    }
    //-----------------------------------------------------------------------------
    //========================添加营业执照=====================================
    @RequestMapping("/addMblicense")
    Integer addMblicense(MultipartFile file, Merchant m, ModelMap map){ return merService.addMblicense(file,m,map);}
    //===============================================================

    //------------------------------------------

    //===================岗位相关===============
    @Autowired
    //括号中填写-service中的beanID
    @Qualifier("JobServiceImp")
    private JobService jobService = new JobServiceImp();
    //新增工作岗位
    @RequestMapping("/addJob")
    public Integer addJob(Job job) {
        return jobService.addJob(job);
    }
    //删除工作岗位
    @RequestMapping("/delJob")
    public Integer delJob(@Param("jid") Integer id) {
        return jobService.delJob(id);
    }
    //编辑工作岗位
    @RequestMapping("/updateJob")
    public Integer updateJob(Job job) {
        return jobService.updateJob(job);
    }
    //查看职位信息
    @RequestMapping("/queryJobByJid")
    public Job queryJobByJid(@Param("jid") Integer id) {
        return jobService.queryJobByJid(id);
    }
    //查看某商家的所有职业
    @RequestMapping("/mAllJob")
    @ResponseBody
    public List<Job> queryAllJobByMid(Integer mid){
        System.out.println(mid);
        System.out.println("======调用获取商铺所有岗位=======");
        List<Job> i = jobService.queryAllJobByMid(mid);
        System.out.println(i);
        return i;
    }
//    @RequestMapping("/queryAllJobByMid")
//    public List<Job> queryAllJobByMid(@Param("mid") Integer id){
//        return jobService.queryAllJobByMid(id);
//    }
//    @RequestMapping("/queryAllJobByMid")
//    public List<Job> queryAllJobByMid(@Param("mid") Integer id){
//        return jobService.queryAllJobByMid(id);
//    }
//    @RequestMapping("/updateMerBasic")
//    @ResponseBody //将return的内容以json格式的字符串返回
//    public String updateMerBasic() throws JsonProcessingException {
//        ObjectMapper mapper = new ObjectMapper();
//        Merchant m = new Merchant("zzz","13994881234");
//        String str = mapper.writeValueAsString(m);
//        System.out.println(str);
//        return str;
//    }



    //删除商铺
//    public String delMerById(){
//        return "";
//    }

//    public String times() throws JsonProcessingException{
//        //时间格式化问题
//
//        Date date = new Date();
//        return JsonUtils.gettJson(date);
//    }
}
