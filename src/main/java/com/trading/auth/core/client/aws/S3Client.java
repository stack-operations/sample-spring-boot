package com.trading.auth.core.client.aws;

import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
//import com.amazonaws.services.s3.AmazonS3;
//import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
//import com.amazonaws.services.sqs.AmazonSQS;
//import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import com.amazonaws.services.s3.model.*;
import com.amazonaws.util.IOUtils;
import com.trading.auth.core.util.PropertyUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

//@Component
public class S3Client {

    private AmazonS3 s3Client;

    private PropertyUtil propertyUtil;

    @Autowired
    public S3Client(PropertyUtil propertyUtil){
        this.propertyUtil = propertyUtil;
        String region = propertyUtil.getValue("s3_region");
        s3Client =  AmazonS3ClientBuilder.standard().withCredentials(new DefaultAWSCredentialsProviderChain()).withRegion(region).build();
    }

    public boolean uploadToS3(String bucket, String path, InputStream byteArrayInputStream) {
        byte[] bytes = null;
        try {
            bytes = IOUtils.toByteArray(byteArrayInputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(bytes.length);
        metadata.setSSEAlgorithm(ObjectMetadata.AES_256_SERVER_SIDE_ENCRYPTION);

        ByteArrayInputStream byteArrayInputStreamRes = new ByteArrayInputStream(bytes);

        PutObjectResult result = s3Client
                .putObject(new PutObjectRequest(bucket, path, byteArrayInputStreamRes, metadata));
        if (result != null) {
            return true;
        }
        return false;
    }

    public InputStream downloadFromS3(String bucket, String completePath){
        InputStream is = null;
        S3Object s3Obj = null;
        try {
            s3Obj = s3Client.getObject(bucket, completePath);
            S3ObjectInputStream stream = s3Obj.getObjectContent();
            ByteArrayOutputStream temp = new ByteArrayOutputStream();
            IOUtils.copy(stream, temp);
            is = new ByteArrayInputStream(temp.toByteArray());
        }catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (s3Obj != null) {
                try {
                    // Close the object
                    s3Obj.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return is;
    }
}
