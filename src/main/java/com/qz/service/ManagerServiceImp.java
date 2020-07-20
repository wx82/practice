package com.qz.service;

import com.qz.dao.managerMapper;
import com.qz.pojo.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImp implements ManagerService{

    public void setManagerMapper(managerMapper managermapper) { this.managermapper = managermapper; }

    //@Autowired
    //@Qualifier("managerMapper")
    private managerMapper managermapper;

    public Manager queryManagerByManame(String maname){return managermapper.queryManagerByManame(maname);}

}
