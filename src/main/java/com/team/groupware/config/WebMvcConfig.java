package com.team.groupware.config;

import java.io.InputStream;
import java.nio.charset.Charset;

import javax.mail.internet.MimeMessage;
import javax.servlet.Filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.team.groupware.interceptor.AdminInterceptor;
import com.team.groupware.interceptor.AnnonymousInterceptor;
import com.team.groupware.interceptor.GojiInterceptor;
import com.team.groupware.interceptor.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Autowired
	private GojiInterceptor gojiInterceptor;
	
	@Autowired
	private AnnonymousInterceptor annonymousInterceptor;
	
	@Autowired
	private LoginInterceptor logininterceptor;
	
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
	}
	
	@Bean
	public HttpMessageConverter<String> responseBodyConverter(){
		return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	}
	
	@Bean
	public Filter characterEncodingFilter() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		return characterEncodingFilter;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registery) {
		registery.addResourceHandler("/img/**").addResourceLocations("file:///C:/upload/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/admin/**");
		registry.addInterceptor(gojiInterceptor)
				.addPathPatterns("/goji/writer")
				.addPathPatterns("/goji/updateView");
		registry.addInterceptor(annonymousInterceptor)
				.addPathPatterns("/anonymous/view");
		registry.addInterceptor(logininterceptor)
				.addPathPatterns("/main")
				.addPathPatterns("/goji/**")
				.addPathPatterns("/anonymous/**")
				.addPathPatterns("/free/**")
				.addPathPatterns("/member/**")
				.addPathPatterns("/message/**")
				.addPathPatterns("/message/**")
				.addPathPatterns("/work/**")
				.addPathPatterns("/fullCal/**");
	}
	
}
