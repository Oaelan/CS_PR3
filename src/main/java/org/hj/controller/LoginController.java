package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.Product_manufacturingDto;
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

	@GetMapping("/")
	public String goLogin(HttpSession session) {
		// 로그인 되어 있는 상태라면 로그인 페이지로 못가게끔
		if (session.getAttribute("id") != null) {
			if (session.getAttribute("id").equals("master")) {
				System.out.println("관리자 로그인 상태");
				return "redirect:/productRegister";
			} else {
				System.out.println("일반 로그인 상태");
				return "redirect:/loginTest";
			}
		} else {
			System.out.println("로그인 전 상태");
			return "login";
		}
	}

	@GetMapping("/productRegister")
	public String goProductRegister(HttpSession session) {
		if (session.getAttribute("id") != null) {
			return "productRegister";
		} else {
			return "redirect:/login";
		}

	}

	@GetMapping("/loginTest")
	public String loginTest() {
		return "loginTest";
	}

	@GetMapping("/plesaeRegister")
	public String goPlesaeRegister() {
		return "plesaeRegister";
	}

	@PostMapping("/login")
	public String LoginM(UserDto ud, HttpSession session) {

		// System.out.println(ud);

		// 일반 유저 로그인 성공 시
		if (lus.loginU(ud) != null) {
			session.setAttribute("id", lus.loginU(ud).getU_id());
			System.out.println("일반 로그인 성공");
			return "redirect:/loginTest"; // 쇼핑몰 메인으로
		}

		// 마스터 로그인 성공 시
		else if (lms.loginM(ud) != null) {
			session.setAttribute("id", lms.loginM(ud).getM_id());
			System.out.println("마스터 로그인 성공");
			return "redirect:/productRegister"; // 관리자 페이지로
			// 로그인 실패 시
		} else {
			System.out.println("로그인 실패");
			return "redirect:/plesaeRegister";
		}

	}
}
