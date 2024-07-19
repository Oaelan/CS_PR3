package org.hj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class c {

	// 로그인 페이지
		@GetMapping("/")
		public String home() {
			System.out.println("홈");
			return "home";
		}

	//테스트 페이지
	@GetMapping("/test")
	public String test() {
		System.out.println("테스트");
		return "UserJoin";
	}
}
