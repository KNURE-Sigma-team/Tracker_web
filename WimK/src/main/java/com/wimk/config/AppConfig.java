package com.wimk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.wimk.secure.UserDetailsServiceImpl;
import com.wimk.sqljobs.ContextClosedListener;
import com.wimk.sqljobs.ContextRefreshedListener;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.wimk.controllers" })
@Import(AppSecurityConfig.class)
public class AppConfig extends WebMvcConfigurerAdapter{
	@Bean
	public ViewResolver jspViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Bean
	public UserDetailsService getUserDetailsService() {
		return new UserDetailsServiceImpl();
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
    public ContextClosedListener contextClosedListener() {
        return new ContextClosedListener();
    }
	@Bean
    public ContextRefreshedListener contextRefreshedListener() {
        return new ContextRefreshedListener();
    }

}