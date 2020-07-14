package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//商铺展示图片
@Data
@AllArgsConstructor  //有参构造
@NoArgsConstructor   //无参构造
public class Mpics {
    private int mpid;
    private String mpaddr;//图片地址
    private int mid;//商铺id
    public int getMpid() {
        return mpid;
    }

    public void setMpid(int mpid) {
        this.mpid = mpid;
    }

    public String getMpaddr() {
        return mpaddr;
    }

    public void setMpaddr(String mpaddr) {
        this.mpaddr = mpaddr;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }


}
