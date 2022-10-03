package com.trading.auth.core.client.aws;

import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import java.util.HashMap;
import java.util.Map;

//@Component
public class SqsClient {

    private AmazonSQS sqsClient;

    private Map<String, String> queueUrlMap = new HashMap<>();

    @Autowired
    public SqsClient(Environment environment){
        String region = environment.getProperty("region");
        sqsClient = AmazonSQSClientBuilder.standard()
                .withCredentials(new DefaultAWSCredentialsProviderChain())
                .withRegion(region)
                .build();
    }
}
