package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int uid;
    private String uname;
    private String usex;
    private String upassword;
    private String uedu;
    private String uskill;
    private String utime;
    private int uphone;
    private String uintro;
    private String upic;
}
