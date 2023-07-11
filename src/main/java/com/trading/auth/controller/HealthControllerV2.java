package com.trading.auth.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/v2/user-svc")
public class HealthControllerV2 {

    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    Environment environment;
	
	@RequestMapping("/health")
    public String getSampleMessage()
    {
        return environment.getProperty("application.name","App")+" V2 is healthy";
    }

    @RequestMapping("/ping")
    public String ping()
    {
        System.out.println("Current time is " + new Date().toString());
        return "V2 App is healthy";
    }

}
