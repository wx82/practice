package com.qz.service;

import com.qz.pojo.License;

import java.util.List;

public interface LicenseService {
    void addLicense(License license);

    List<License> queryAllLis();
}
