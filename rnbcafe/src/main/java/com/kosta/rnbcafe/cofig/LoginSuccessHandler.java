package com.kosta.rnbcafe.cofig;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


/**
 * 로그인 성공후에 작업을 진행하는 클래스 
 */
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	/**
	 * 로그인 성공후에 해당 URL로 이동한다. 
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		response.setStatus(HttpServletResponse.SC_OK);
		response.sendRedirect("/rnbcafe");
	}
	

}
