package com.livestockapi.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class OpenApiConfig {

    @Value("${server.port:8080}")
    private String serverPort;

    // Railway public URL (set this in Railway environment variables)
    @Value("${RAILWAY_PUBLIC_DOMAIN:}")
    private String railwayDomain;

    // Alternative: Use a custom environment variable
    @Value("${API_BASE_URL:}")
    private String apiBaseUrl;

    @Bean
    public OpenAPI customOpenAPI() {
        List<Server> servers = new ArrayList<>();

        // Add Railway/Production server if domain is configured
        if (!railwayDomain.isEmpty()) {
            Server productionServer = new Server();
            productionServer.setUrl("https://" + railwayDomain);
            productionServer.setDescription("Production Server (Railway)");
            servers.add(productionServer);
        } else if (!apiBaseUrl.isEmpty()) {
            // Alternative: Use custom API_BASE_URL environment variable
            Server productionServer = new Server();
            productionServer.setUrl(apiBaseUrl);
            productionServer.setDescription("Production Server");
            servers.add(productionServer);
        }

        // Always add local server for development
        Server localServer = new Server();
        localServer.setUrl("http://localhost:" + serverPort);
        localServer.setDescription("Local Development Server");
        servers.add(localServer);

        return new OpenAPI()
                .servers(servers)
                .info(new Info()
                        .title("Livestock Breeds API")
                        .version("1.0.0")
                        .description("Comprehensive REST API providing detailed information about livestock breeds including characteristics, care requirements, and metadata. Sources: FAO DAD-IS, Oklahoma State University, USDA.")
                        .contact(new Contact()
                                .name("API Support")
                                .email("support@example.com")
                                .url("https://github.com/yourusername/livestock-breeds-api"))
                        .license(new License()
                                .name("MIT License (Code) / CC BY 4.0 (Data)")
                                .url("https://github.com/yourusername/livestock-breeds-api/blob/main/LICENSE")));
    }
}
