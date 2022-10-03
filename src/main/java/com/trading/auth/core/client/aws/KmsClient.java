package com.trading.auth.core.client.aws;

import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
import com.amazonaws.services.kms.AWSKMS;
import com.amazonaws.services.kms.AWSKMSClientBuilder;
import com.amazonaws.services.kms.model.DecryptRequest;
import com.amazonaws.services.kms.model.EncryptRequest;
import com.trading.auth.core.util.PropertyUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

//@Component
public class KmsClient {

    private AWSKMS kmsClient;

    private PropertyUtil propertyUtil;


    @Autowired
    public KmsClient(PropertyUtil propertyUtil){
        this.kmsClient = AWSKMSClientBuilder.standard().withCredentials(new DefaultAWSCredentialsProviderChain()).build();
        this.propertyUtil = propertyUtil;
    }

    public String encrypt(String data) {
        //String keyId = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab";
        String keyId = propertyUtil.getValue("kms_key_id");
        ByteBuffer plaintext = ByteBuffer.wrap(data.getBytes());
        EncryptRequest req = new EncryptRequest().withKeyId(keyId).withPlaintext(plaintext);
        ByteBuffer ciphertext = kmsClient.encrypt(req).getCiphertextBlob();
        return StandardCharsets.UTF_8.decode(ciphertext).toString();
    }

    public String decrypt(String data){
        //String keyId = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab";
        String keyId = propertyUtil.getValue("kms_key_id");
        ByteBuffer ciphertextBlob = ByteBuffer.wrap(data.getBytes());

        DecryptRequest req = new DecryptRequest().withCiphertextBlob(ciphertextBlob).withKeyId(keyId);
        ByteBuffer plainText = kmsClient.decrypt(req).getPlaintext();
        return StandardCharsets.UTF_8.decode(plainText).toString();
    }


}
