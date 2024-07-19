package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.UserDto;
import org.hj.service.LoginM_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	
	@Autowired
	LoginM_Service lms;

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
		// 마스터 로그인 성공 시
		if(lms.loginM(ud)!=null) {
			session.setAttribute("id", lms.loginM(ud).getU_id());
			
		}else {
			System.out.println("로그인 실패");
		}
		
		return "redirect:/loginTest";
	}
}
