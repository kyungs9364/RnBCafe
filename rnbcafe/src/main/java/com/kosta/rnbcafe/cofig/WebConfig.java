package com.kosta.rnbcafe.cofig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;


@Configuration
@EnableWebMvc
@EnableAspectJAutoProxy
@ComponentScan("com.kosta.rnbcafe")
public class WebConfig extends WebMvcConfigurerAdapter {
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		super.addArgumentResolvers(argumentResolvers);
	}
	
    /**
     * static 리소스 처리
     * @param registry
     */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	       registry.addResourceHandler("/resources/**")  //리소스에 접근할 URL 패턴
           .addResourceLocations("/WEB-INF/resources/");  //리소스가 있는 위치
	       
	}
	
    /**
     * 고정적인 리소스 처리요청을 자신이 직접 처리하지 않고 서블릿 컨테이너의 디폴트 서블릿 전달을 요청.
     * @param configurer
     */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	/**
	 * jsp 리졸뷰 설정
	 * @return
	 */
	@Bean
	public ViewResolver viewResolver() {	
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(org.springframework.web.servlet.view.JstlView.class);
		return resolver;
	}
	
	@Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		final MappingJackson2HttpMessageConverter jconvert = new MappingJackson2HttpMessageConverter();
		final ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		jconvert.setObjectMapper(objectMapper);
		List<MediaType> supportedMediaTypes = new ArrayList<MediaType>();
		supportedMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
		supportedMediaTypes.add(MediaType.APPLICATION_FORM_URLENCODED);		
		jconvert.setSupportedMediaTypes(supportedMediaTypes);
		converters.add(jconvert);
		super.configureMessageConverters(converters);
     }
	
	@Bean
	public CommonsMultipartResolver multipartResolver() throws IOException {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
	    resolver.setDefaultEncoding("utf-8");
	    resolver.setMaxUploadSize(5242880);
	    resolver.setUploadTempDir(new FileSystemResource("c:/tmp/test"));
	    return resolver;
	}

}
