package com.camp.web.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class CampAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub

		System.out.println("로그인 성공ㅇ");

		HttpSession session = request.getSession();
		
		//session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");

		SavedRequest savedRequest = (SavedRequest)session.getAttribute
				("SPRING_SECURITY_SAVED_REQUEST");

		if(savedRequest != null) {
			String returnURL = savedRequest.getRedirectUrl();
			response.sendRedirect(returnURL);
		}
		else{
			response.sendRedirect("/index");
		}
	}

}
