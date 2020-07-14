package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor  //有参构造
@NoArgsConstructor   //无参构造
public class Comment {
    private int cid;//主键
    private int uid;//用户id
    private int mid;//商铺id
    private String einfor;//用户评价
    private String eminfor;//商家回复

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getEinfor() {
        return einfor;
    }

    public void setEinfor(String einfor) {
        this.einfor = einfor;
    }

    public String getEminfor() {
        return eminfor;
    }

    public void setEminfor(String eminfor) {
        this.eminfor = eminfor;
    }


}
