package com.qz.controller;

import com.qz.pojo.*;
import com.qz.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/merchant")

public class merController {
    //controller层调用service层
    @Autowired
    //括号中填写-service中的beanID
    @Qualifier("MerServiceImp")
    private MerService merService = new MerServiceImp();
    //查信息部分
    //=============所有商家所有信息=============
    @RequestMapping("/allmerTT")
    @ResponseBody
    List<Merchant> queryAllMer(){
        return merService.queryAllMer();
    }

    //===============查询一个商家信息==============
    @RequestMapping("/oneMer")
    @ResponseBody
    Merchant queryMerById(Integer mid){
        return merService.queryMerById(mid);
    }
    //========================添加营业执照=====================================
    @RequestMapping("/addMblicense")
    String addMblicense(@RequestParam( value = "license",required = false) CommonsMultipartFile file, HttpSession session, Merchant m) {
        System.out.println("调用添加营业执照");
        System.out.println("文件：" + file);
        System.out.println(m.getMid());
        Integer i = merService.addMblicense(file,session,m);
        if(i == 1){
            return "redirect:/certify_manager.jsp";
        }else {
            return "上传失败";
        }

    }



    //修改商铺基本信息
    @RequestMapping(value="/updateMerBasic",method = RequestMethod.POST)
    @ResponseBody
    public Integer updateMerBasic(Merchant m){
        return merService.updateMerBasic(m);
    }

    @RequestMapping("/updateMerInfor")
    @ResponseBody
    Integer updateMerInfor(Merchant m){
        return merService.updateMerInfor(m);
    }

    @RequestMapping("/updateMerWel")
    @ResponseBody
    public Integer updateMerWel(Merchant m){
        return merService.updateMerWel(m);
    }

    @RequestMapping("/updateMerD")
    @ResponseBody
    Integer updateMerD(Merchant m){
        return merService.updateMerD(m);
    }

    //修改密码
    @RequestMapping("/updateMerPsw")
    @ResponseBody
    Integer updateMerPsw(@RequestBody Merchant m){
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
    @ResponseBody
    Integer addcomment(@RequestBody Comment cm){
        System.out.println("======添加评论=========");
        System.out.println("获取的cm："+cm);
        Integer i = com.addcomment(cm);
        System.out.println("controller的结果"+i);
        return i;
    }
    //商家回复评论

    @RequestMapping("/updatecomment")
    @ResponseBody
    Integer updatecomment(@RequestBody Comment cm){
        System.out.println("controller收到的comment数据："+cm);
        return com.updatecomment(cm);
    }

    //删除商家评论
    @RequestMapping("/delMerComment")
    @ResponseBody
    Integer delMercomment(Integer cid) {
        System.out.println("controller收到的id数据："+cid);
        return com.delMerC(cid);
//        return com.delcomment(id);
    }
    //查看该商家所有评论,无头像
    @RequestMapping("/allMerComment")
    @ResponseBody
    public Object queryAllCommentByMid(Integer mid){
        System.out.println("=========调用获取商家所以评论的方法==========");
        HashMap allcomment = new HashMap();
        allcomment.put("comments",com.queryAllCommentByMid(mid));
        System.out.println(allcomment);
        return allcomment;
    }
    //查看该商家所有评论,有头像
    @RequestMapping("/allComment")
    @ResponseBody
    public Object allCommentByMid(Integer mid){
        System.out.println("=========调用获取商家所以评论的方法==========");
        HashMap allcomment = new HashMap();
        allcomment.put("comments",com.queryAllComments(mid));
        System.out.println(allcomment);
        return allcomment;
    }
    //-----------------------------------------------------------------------------

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
    public Integer delJob(Integer jid) {
        return jobService.delJob(jid);
    }
    //编辑工作岗位
    @RequestMapping("/updateJob")
    public Integer updateJob(Job job) {
        return jobService.updateJob(job);
    }
    @RequestMapping("/updateAaw")
    @ResponseBody
    public Integer updateAaw(@RequestBody Job job){
        System.out.println("修改年龄和福利"+job);
        return jobService.updateAaw(job);
    }
    //查看职位信息
    @RequestMapping("/queryJobByJid")
    @ResponseBody
    public Job queryJobByJid(Integer jid) {
        System.out.println("jonController获取的数据："+jid);
        Job j = jobService.queryJobByJid(jid);
        System.out.println(j);
        return j;
    }
    //查看某商家的所有职业
    @RequestMapping("/mAllJob")
    @ResponseBody
    public Object queryAllJobByMid(Integer mid){
        System.out.println(mid);
        System.out.println("======调用获取商铺所有岗位=======");
        HashMap jobs = new HashMap();
        jobs.put("jobs",jobService.queryAllJobByMid(mid));

        System.out.println(jobs);
        return jobs;
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
//查询商家展示
//@RequestMapping("/allmer")
//@ResponseBody
//public String list(Model model){
//    List<Merchant> list = merService.queryAllMer();
//    model.addAttribute("list",list);
//    return "allmer";
//}
    //=================================================================
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
    //    Object updateMerPsw(@RequestBody merchantInfor m) {
//        System.out.println("开始修改密码");
//        System.out.println(m);
//        //先获取密码
//        HashMap hashMap = new HashMap();
//
//        //return hashMap;
//        int mid = m.getMid();
//        String psw = merService.queryPsw(mid);
//        System.out.println("原始密码："+psw);
//        if (m.getMpassword().equals(psw)) {
//            Merchant mer = new Merchant();
//            mer.setMid(mid);
//            mer.setMassword(m.getMpassword2());
//            int i =  merService.updateMerPsw(mer);
//            System.out.println(i);
//            hashMap.put("status",i);
//            return hashMap;
//        } else {
//            hashMap.put("status", 2);
//            return hashMap;
//        }
//    }

    //后台管理查看所有商家
    @RequestMapping("/adminGetMerchants")
    @ResponseBody
    public Object showMerchants(){
        List<Merchant> list = merService.queryAllMer();
        //System.out.println(list);
        HashMap merchants = new HashMap();
        merchants.put("merchants",list);
        return merchants;
    }

    //后台管理通过id查找商家
    @RequestMapping("/adminQueryMerchantById")
    @ResponseBody
    public Object queryMerchantById(int mid){
        System.out.println(mid);
        Merchant merchant = merService.queryMerById(mid);
        System.out.println(merchant);
        HashMap hashmap = new HashMap();
        if(merchant!=null){
            //用户存在
            hashmap.put("merchant",merchant);
            hashmap.put("isExist",true);
        }else{
            //用户不存在
            hashmap.put("isExist",false);
        }
        return hashmap;
    }

    //后台管理通过mname来查找商家
    @RequestMapping("/adminQueryMerchantByMname")
    @ResponseBody
    public Object queryMerchantByMname(String mname){
        System.out.println(mname);
        List<Merchant> merchants = merService.queryMerchantByMname(mname);
        System.out.println(merchants);
        HashMap hashmap = new HashMap();
        if(!merchants.isEmpty()){
            //用户存在
            hashmap.put("merchants",merchants);
            hashmap.put("isExist",true);
        }else{
            //用户不存在
            hashmap.put("isExist",false);
        }
        return hashmap;
    }

    //后台管理根据id删除用户
    @RequestMapping("/adminDeleteMerchantById")
    @ResponseBody
    public Object deleteMerchantById(int mid){
        System.out.println(mid);
        merService.deleteMerchantById(mid);
        HashMap hashmap = new HashMap();
        hashmap.put("isSuccessful",true);
        return hashmap;
    }
}
