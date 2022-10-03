package com.trading.auth.core.util;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Properties;

@Component
public class PropertyUtil {

    private Properties properties;

    @PostConstruct
    public void PropertyUtil(){
        //Initialise it from config files.
        properties = new Properties();
    }

    public String getValue(String key){
        return properties.getProperty(key);
    }
}
