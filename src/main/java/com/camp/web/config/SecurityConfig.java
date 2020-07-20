package com.camp.web.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.camp.web.security.CampAuthenticationFailHandler;
import com.camp.web.security.CampAuthenticationSuccessHandler;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;

	
	//어떤페이지에서 인증이필요한지
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		//.antMatchers("/admin/**").authenticated()
			//.antMatchers("/camp/**").authenticated()
			.antMatchers("/teacher/**").hasAnyRole("TEACHER" , "ADMIN")
			.antMatchers("/student/**").hasAnyRole("STUDENT" , "ADMIN")
			.antMatchers("/member/home").authenticated()
		.and()
	
		.formLogin()
			.loginPage("/member/login")
			.loginProcessingUrl("/member/login")
			.defaultSuccessUrl("/index")
			.successHandler(new CampAuthenticationSuccessHandler())
//			.failureHandler(new CampAuthenticationFailHandler())
		.and()
		
		.logout()
			.logoutUrl("/member/logout")
			.logoutSuccessUrl("/index")
			.invalidateHttpSession(true)
		.and()
		
		.csrf()
			.disable();
//		super.configure(http);
	}
	
	//현재 로그인한유저가 어떤역할자인지.
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.inMemoryAuthentication(); // 사용자 정보를 메모리상에서
//		auth.jdbcAuthentication(); 	   //사용자 정보를 DB에서 
//		auth.ldapAuthentication(); 	   //사용자 정보를 도메인컨트롤러에서
		
//		auth
//		.inMemoryAuthentication()
//		.withUser("newlec")
//			.password("{noop}111")
//			.roles("ADMIN")
//		.and()
//		.withUser("dragon")
//			.password("111")
//			.roles("TEACHER");	

		auth
			.jdbcAuthentication()
			.dataSource(dataSource)
			.usersByUsernameQuery("select uid id, pwd password , 1 enabled from member where uid=?")
			.authoritiesByUsernameQuery("SELECT uid id, roleId from member where uid=?")
			.passwordEncoder(new BCryptPasswordEncoder());
		
		
	}

}
