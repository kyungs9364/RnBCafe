package com.kosta.rnbcafe.cofig;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@ComponentScan("com.kosta.rnbcafe")
@Configuration
@EnableWebSecurity  //웹보안 설정 
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	  	@Autowired
	    DataSource dataSource;

	    @Autowired
	    private LoginSuccessHandler loginSuccessHandler;

	    @Autowired
	    private MemberDetailService userDetailService;

	    @Override
	    public void configure(WebSecurity web) throws Exception {
	        web.ignoring().antMatchers("/resources/**");
	        web.ignoring().antMatchers("/image/**");
	        web.ignoring().antMatchers("/member/insertMember");
	        web.ignoring().antMatchers("/member/idCheck");
	    }

	    @Override
	    protected void configure(HttpSecurity http) throws  Exception {
	        http.authorizeRequests().anyRequest().authenticated().and().formLogin().loginPage("/login")
	                .loginProcessingUrl("/login").failureUrl("/login?error=true").successHandler(loginSuccessHandler)
	                .usernameParameter("username").passwordParameter("password").permitAll().and().logout().deleteCookies("remove")
	                .invalidateHttpSession(true).logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	                .logoutSuccessUrl("/").and().csrf().disable();
	    }

	    /**
	     * BCryptPasswordEncoder: bcrypt 해시 알고리즘을 이용하여 입력받은 데이터를 암호화한다
	     * @return
	     */
	    @Bean
	    public PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }

	    @Autowired
	    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	        auth.authenticationProvider(authenticationProvider());
	    }

	    /**
	     * 데이터베이스 인증용 Provider
	     * @return
	     */
	    @Bean
	    public DaoAuthenticationProvider authenticationProvider() {
	        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
	        authenticationProvider.setUserDetailsService(userDetailService);
	        authenticationProvider.setPasswordEncoder(passwordEncoder()); //패스워드를 암호활 경우 사용한다
	        return authenticationProvider;
	    }
}
