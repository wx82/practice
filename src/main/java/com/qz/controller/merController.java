package com.qz.controller;

import com.qz.pojo.Comment;
import com.qz.pojo.Merchant;
import com.qz.pojo.Mpics;
import com.qz.service.*;
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
    public int updateMerBasic(@RequestBody Merchant m){
        return merService.updateMerBasic(m);
    }
    @RequestMapping("/updateMerInfor")
    @ResponseBody
    int updateMerInfor(Merchant m){
        return merService.updateMerInfor(m);
    }
    @RequestMapping("/updateMerD")
    @ResponseBody
    int updateMerD(Merchant m){
        return merService.updateMerD(m);
    }
    //修改手机号
    @RequestMapping("/updateMerPhone")
    int updateMerPhone(Merchant m){
        //先调用获取验证码，返回验证码
        //再输入手机号，返回验证码成功后
        //存入数据库
        return merService.updateMerPhone(m);
    }
    //修改密码
    @RequestMapping("/updateMerPsw")
    int updateMerPsw(Merchant m){
        //先获取验证码，返回验证码
        //存入数据库
        return merService.updateMerPsw(m);
    }
    //===========商铺展示图图片操作=================
    private MpicsService mpicsService;
    //1、增加商铺展示图片
    @RequestMapping("/addMpic")
    public int addMpic(MultipartFile file, Mpics mp, ModelMap map){
        return mpicsService.addMpic(file, mp, map);
    }
    @RequestMapping("/delMpic")
    int delMpic(int id){
        return mpicsService.delMpic(id);
    }
    @RequestMapping("/queryAllMerById")
    List<Mpics> queryAllMerById(int id){
        return mpicsService.queryAllMerById(id);
    }

    //回复商家评论
    private CommentService com = new CommentServiceImp();
    @RequestMapping("/updatecomment")
    int updatecomment(Comment cm){
        return com.updatecomment(cm);
    }
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
