package com.example.javamondodb.utils;

import com.example.javamondodb.model.ApiResponse;
import org.springframework.http.HttpStatus;

public class ApiResponseUtils {

    public static ApiResponse Ok(String msg, Object obj) {
        return new ApiResponse.ApiResponseBuilder()
                .withStatus(HttpStatus.OK)
                .withCode("OK")
                .withObject(obj)
                .withMessage(msg).build();
    }


    public static ApiResponse Error(String msg) {
        return new ApiResponse.ApiResponseBuilder()
                .withStatus(HttpStatus.INTERNAL_SERVER_ERROR)
                .withCode("INTERNAL_SERVER_ERROR")
                .withMessage(msg).build();
    }

}