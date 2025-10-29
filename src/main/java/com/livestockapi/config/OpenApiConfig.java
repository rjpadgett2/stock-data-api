package com.livestockapi.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class OpenApiConfig {

    @Value("${server.port:8080}")
    private String serverPort;

    @Bean
    public OpenAPI customOpenAPI() {
        Server localServer = new Server();
        localServer.setUrl("http://localhost:" + serverPort);
        localServer.setDescription("Local Development Server");

        return new OpenAPI()
                .servers(List.of(localServer))
                .info(new Info()
                        .title("Livestock Breeds API")
                        .version("1.0.0")
                        .description("Comprehensive REST API providing detailed information about livestock breeds including characteristics, care requirements, and metadata. All data is properly sourced and cited.")
                        .contact(new Contact()
                                .name("API Support")
                                .email("support@example.com")
                                .url("https://github.com/yourusername/livestock-breeds-api"))
                        .license(new License()
                                .name("MIT License (Code) / CC BY 4.0 (Data)")
                                .url("https://github.com/yourusername/livestock-breeds-api/blob/main/LICENSE")));
    }
}
