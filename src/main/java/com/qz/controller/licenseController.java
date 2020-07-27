package com.qz.controller;

import com.qz.pojo.License;
import com.qz.pojo.Merchant;
import com.qz.service.LicenseService;
import com.qz.service.MerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class licenseController {
    @Autowired
    @Qualifier("LicenseServiceImp")
    private LicenseService licenseService;
    @Autowired
    @Qualifier("MerServiceImp")
    private MerService merService;

    //添加商家认证信息
    @RequestMapping("/setLicenseInfo")
    @ResponseBody
    public Object verifyLicense(String rnum,String cnum,String mname,String maddress,String lperson,String vdate,String edate,String mid){

        //在license表增加信息
        License license = new License();
        license.setCnum(cnum);
        license.setRnum(rnum);
        license.setMname(mname);
        license.setEdate(edate);
        license.setVdate(vdate);
        license.setMaddress(maddress);
        license.setLperson(lperson);
        license.setMid(Integer.parseInt(mid));
        System.out.println(cnum);
        licenseService.addLicense(license);

        //修改merchant表的minputpic属性为true
        Merchant merchant = new Merchant();
        merchant.setMid(Integer.parseInt(mid));
        merchant.setMinputpic(true);
//        System.out.println(merchant);
//        System.out.println(merService.updateMerMinputPic(merchant));;
        merService.updateMerMinputPic(merchant);
        HashMap hashMap = new HashMap();
        hashMap.put("isSuccess",true);
        return hashMap;
    }

    //获取商家认证信息
    @RequestMapping("/getLicenseInfo")
    @ResponseBody
    public Object getLicense(){
        System.out.println("getLicenseInfo");
        HashMap hashMap = new HashMap();
        List<Merchant> merchants = merService.queryAllMer();
        List<License> licenses=licenseService.queryAllLis();
        hashMap.put("merchants",merchants);
        hashMap.put("licenses",licenses);
        return hashMap;
    }

    //提交商家认证是否通过以及失败原因
    @RequestMapping("/setLicenseResult")
    @ResponseBody
    public Object setLicenseResult(int mid,Boolean isvarifyfail, String failreason){
        System.out.println("setLicenseInfo");
        HashMap hashMap = new HashMap();
        Merchant merchant = new Merchant();
        merchant.setMid(mid);
        // 是否提交
        merchant.setMinputpic(false);
        // 是否验证失败
        merchant.setIsverifyfail(isvarifyfail);
        // 是否通过认证
        if(isvarifyfail == false){
            merchant.setMtag(true);
        }else{
            merchant.setMtag(false);
        }
        // 认证失败原因
        merchant.setFailreason(failreason);
        merService.updateMerLis(merchant);
        hashMap.put("isSuccess",true);
        return hashMap;
    }
}
