package com.livestockapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class LivestockBreedsApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(LivestockBreedsApiApplication.class, args);
    }
}
