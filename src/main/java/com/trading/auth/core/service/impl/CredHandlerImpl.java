package com.trading.auth.core.service.impl;

import com.trading.auth.core.client.aws.KmsClient;
import com.trading.auth.core.client.aws.S3Client;
import com.trading.auth.core.service.CredHandler;
import com.trading.auth.core.util.PropertyUtil;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;

//@Service
public class CredHandlerImpl implements CredHandler {

    @Autowired
    private KmsClient kmsClient;

    @Autowired
    private S3Client s3Client;

    @Autowired
    private PropertyUtil propertyUtil;

    @Override
    //Need to cache this data or need to set it as env variable on change or first time fetch from s3
    //for fast access. Avoiding network call for each request
    public void storeCred(String key, String value, String s3Path) throws IOException, ParseException {
        String bucket = propertyUtil.getValue("s3_bucket");
        JSONObject originalCred = getCred(s3Path);
        originalCred.put(key, value);
        String encryptedData = kmsClient.encrypt(originalCred.toJSONString());
        s3Client.uploadToS3(bucket, s3Path, IOUtils.toInputStream(encryptedData));
    }

    @Override
    public String getCred(String key, String s3Path) throws IOException, ParseException {
        JSONObject originalCred = getCred(s3Path);
        return (String) originalCred.get(key);
    }

    private JSONObject getCred(String s3Path) throws ParseException, IOException {
        String bucket = propertyUtil.getValue("s3_bucket");
        InputStream is = s3Client.downloadFromS3(bucket, s3Path);
        StringWriter writer = new StringWriter();
        IOUtils.copy(is, writer);
        String theString = writer.toString();
        String decryptedData = kmsClient.decrypt(theString);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(decryptedData);
        return jsonObject;
    }
}
