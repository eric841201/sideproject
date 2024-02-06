package com.example.demo;

public class ResourceDataException extends Exception {
    
    public ResourceDataException() {
    }

    public ResourceDataException(String message) {
        super(message);
    }

    public ResourceDataException(String message, Throwable cause) {
        super(message, cause);
    }

    public ResourceDataException(Throwable cause) {
        super(cause);
    }
    
}

