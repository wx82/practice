package com.qz.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import java.text.SimpleDateFormat;

public class JsonUtils {
    public static String gettJson(Object object){
        return gettJson(object,"yyyy-MM-dd hh:mm:ss");
    }
    public static String gettJson(Object object,String dateFormat){
        //时间格式化问题
        ObjectMapper mapper = new ObjectMapper();
        //关闭时间戳功能
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS,false);
        //时间格式化
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);//"yyyy-mm-dd hh:mm:ss"
        mapper.setDateFormat(simpleDateFormat);

        try {
            return mapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
