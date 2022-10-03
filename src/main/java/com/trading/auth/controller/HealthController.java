package com.trading.auth.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RestController
@RequestMapping("/v1/user-svc")
public class HealthController {

    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    Environment environment;
	
	@RequestMapping("/health")
    public String getSampleMessage()
    {
        return environment.getProperty("application.name","App")+" is healthy";
    }

    @RequestMapping("/ping")
    public String ping()
    {
        System.out.println("Current time is " + new Date().toString());
        return "App is healthy";
    }

}
