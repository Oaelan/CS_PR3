package org.hj.controller;

import org.hj.model.UserDto;
import org.hj.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService js;
	
	@GetMapping("/join")
	public String Join() {
		return "UserJoin";
	}
	
	@PostMapping("/join")
	public String JoinPut(UserDto udt) {
		js.JoinPut(udt);
		return "home";
	}
}
