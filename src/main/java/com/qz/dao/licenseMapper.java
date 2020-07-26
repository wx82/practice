package com.qz.dao;

import com.qz.pojo.License;

import java.util.List;

public interface licenseMapper {
    void addLicense(License license);

    List<License> queryAllLis();
}
