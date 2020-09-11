package com.example.javamondodb.model;


import org.springframework.http.HttpStatus;

public class ApiResponse {
    private HttpStatus status;
    private String code;
    private String message;
    private Object object;


    public HttpStatus getStatus() {
        return status;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public static final class ApiResponseBuilder {
        private HttpStatus status;
        private String code;
        private String message;
        private Object object;


        public ApiResponseBuilder() {
        }

        public static ApiResponseBuilder anApiResponse() {
            return new ApiResponseBuilder();
        }

        public ApiResponseBuilder withStatus(HttpStatus status) {
            this.status = status;
            return this;
        }

        public ApiResponseBuilder withCode(String code) {
            this.code = code;
            return this;
        }

        public ApiResponseBuilder withMessage(String message) {
            this.message = message;
            return this;
        }


        public ApiResponseBuilder withObject(Object object) {
            this.object = object;
            return this;
        }


        public ApiResponse build() {
            ApiResponse apiResponse = new ApiResponse();
            apiResponse.status = this.status;
            apiResponse.code = this.code;
            apiResponse.message = this.message;
            apiResponse.object = this.object;
            return apiResponse;
        }
    }

}