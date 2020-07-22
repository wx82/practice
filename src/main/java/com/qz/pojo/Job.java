package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Job {
    private int jid;
    private String jrtime;
    private String jintro;
    private String jaddress;
    private String jtime;
    private String jcontent;
//    private String jtype;
    private String jedu;
    private String jrequire;
    private String jsalary;
    private String jtreatment;
    private String jphone;
    private String jname;
    private String jage;
    private Integer mid;//商铺id
//    private String jexperience;//经验要求
    private String jcity;
}
