package com.qz.service;

import com.qz.pojo.License;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LicenseServiceImp implements LicenseService {

    private com.qz.dao.licenseMapper licenseMapper;

    public void setLicenseMapper(com.qz.dao.licenseMapper licenseMapper) { this.licenseMapper=licenseMapper;}

    public void addLicense(License license){licenseMapper.addLicense(license);}

    public List<License> queryAllLis(){ return licenseMapper.queryAllLis();}
}
