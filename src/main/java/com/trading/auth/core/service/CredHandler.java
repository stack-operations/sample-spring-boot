package com.trading.auth.core.service;

import org.json.simple.parser.ParseException;

import java.io.IOException;

public interface CredHandler {

    public void storeCred(String key, String value, String s3Path) throws IOException, ParseException;

    public String getCred(String key, String s3Path) throws IOException, ParseException;
}
