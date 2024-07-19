package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.UserDto;
import org.hj.service.Pub.LoginU_Service;
import org.hj.service.Sub.LoginM_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	
	@Autowired
	LoginM_Service lms;
	
	@Autowired
	LoginU_Service lus;

	@GetMapping("/login")
	public String goLogin() {
		return "login";
	}


	@GetMapping ("/loginTest")
	public String loginTest(){
		return "loginTest";
	}
	
	@PostMapping("/login")
	public String LoginM(UserDto ud, HttpSession session) {

		System.out.println(ud);
		
		// 일반 유저 로그인 성공 시
		if(lus.loginU(ud) != null) {
			session.setAttribute("id", lus.loginU(ud).getU_id());
			System.out.println("일반 로그인 성공");
		}
		
		// 마스터 로그인 성공 시
		else if(lms.loginM(ud)!=null) {
			session.setAttribute("id", lms.loginM(ud).getM_id());
			System.out.println("마스터 로그인 성공");
			
		}else {
			System.out.println("로그인 실패");
		}
		
		return "redirect:/loginTest";
	}
}
