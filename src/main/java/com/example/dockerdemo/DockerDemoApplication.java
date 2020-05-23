package com.example.dockerdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DockerDemoApplication extends SpringBootServletInitializer {

    @RequestMapping(value = "/hello-docker", method = RequestMethod.GET)
    public String dockerHello() {
        return "Docker Hello World";
    }

    public static void main(String[] args) {
        SpringApplication.run(DockerDemoApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(DockerDemoApplication.class);
    }
}
