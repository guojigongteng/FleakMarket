package com.ct.config;

import com.ct.utils.UploadPathResolver;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.io.File;

/**
 * @className: WebMvcConfigurationSupport
 * @Description: 静态资源配置类
 * @author: ct
 * @date: 2022/2/20 11:25
 */
@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

    //绑定文件上传路径到uploadPath
    @Value("${web.upload-path}")
    private String uploadPath;

    /**
     * 配置静态访问资源
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        File uploadRoot = UploadPathResolver.resolve(uploadPath);
        String uploadLocation = uploadRoot.toURI().toString();

        // Existing database records use /2024/... while new records use /images/2024/....
        // Serve both forms so old products and avatars remain visible after moving the project.
        registry.addResourceHandler("/images/**")
                .addResourceLocations("classpath:/static/images/", uploadLocation);
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/images/", "classpath:/static/", uploadLocation);

    }

    /**
     * 后端跨域配置
     * @param registry
     */
    /*@Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "DELETE", "PUT")
                .maxAge(3600);
    }*/
}
