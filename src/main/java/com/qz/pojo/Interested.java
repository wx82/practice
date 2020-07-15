package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Interested {
    private int iid;
    private int uid;
    private int jid;
    public int getIid() {
        return iid;
    }
}
