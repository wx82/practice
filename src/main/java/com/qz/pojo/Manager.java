package com.qz.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Manager {
    public String getManame() {
        return maname;
    }

    public void setManame(String maname) {
        this.maname = maname;
    }

    public String getMapassword() {
        return mapassword;
    }

    public void setMapassword(String mapassword) {
        this.mapassword = mapassword;
    }

    private String maname;
    private String mapassword;
}
