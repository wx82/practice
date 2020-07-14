package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor  //有参构造
@NoArgsConstructor   //无参构造
public class Merchant {
    private int mid;
    private String mname;//公司名称
    private String mnickname;//账户昵称
    private String mpassword;//z=注册密码
    private String mlogo;
    private String mrphone;
    private String maddcity;//市
    private String maddcounty;//县
    private String maddtown;//镇
    private String maddress;//详细地址
    private Boolean mtag;//是否认证
    private String mscale;//规模
    private String mwelfare;//福利
    private String minfo;//店铺信息
    private String dname;//负责人
    private int dphone;//负责人电话
    private float mstar;//星级
    private String mlicense;//营业执照
    private Boolean minputpic;//是否提交营业执照
    private List<Mpics> mpic;//店铺展示 一个店铺拥有多个展示图片

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMnname() {
        return mname;
    }

    public void setMnname(String mname) {
        this.mname = mname;
    }

    public String getMnickname() {
        return mnickname;
    }

    public void setMnickname(String mnickname) {
        this.mnickname = mnickname;
    }

    public String getMassword() {
        return mpassword;
    }

    public void setMassword(String mpassword) {
        this.mpassword = mpassword;
    }

    public String getMlogo() {
        return mlogo;
    }

    public void setMlogo(String mlogo) {
        this.mlogo = mlogo;
    }

    public String getMrphone() {
        return mrphone;
    }

    public void setMrphone(String mrphone) {
        this.mrphone = mrphone;
    }

    public String getMaddcity() {
        return maddcity;
    }

    public void setMaddcity(String maddcity) {
        this.maddcity = maddcity;
    }

    public String getMaddcounty() {
        return maddcounty;
    }

    public void setMaddcounty(String maddcounty) {
        this.maddcounty = maddcounty;
    }

    public String getMaddtown() {
        return maddtown;
    }

    public void setMaddtown(String maddtown) {
        this.maddtown = maddtown;
    }

    public String getMaddress() {
        return maddress;
    }

    public void setMaddress(String maddress) {
        this.maddress = maddress;
    }

    public Boolean getMtag() {
        return mtag;
    }

    public void setMtag(Boolean mtag) {
        this.mtag = mtag;
    }

    public String getMscale() {
        return mscale;
    }

    public void setMscale(String mscale) {
        this.mscale = mscale;
    }

    public String getMwelfare() {
        return mwelfare;
    }

    public void setMwelfare(String mwelfare) {
        this.mwelfare = mwelfare;
    }

    public String getMinfo() {
        return minfo;
    }

    public void setMinfo(String minfo) {
        this.minfo = minfo;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public int getDphone() {
        return dphone;
    }

    public void setDphone(int dphone) {
        this.dphone = dphone;
    }

    public float getMstar() {
        return mstar;
    }

    public void setMstar(float mstar) {
        this.mstar = mstar;
    }

    public String getMlicense() {
        return mlicense;
    }

    public void setMlicense(String mlicense) {
        this.mlicense = mlicense;
    }

    public Boolean getMinputpic() {
        return minputpic;
    }

    public void setMinputpic(Boolean minputpic) {
        this.minputpic = minputpic;
    }



    public Merchant(String mname, String mrphone){
        this.mnickname = mname;
        this.mrphone = mrphone;
    }
}
