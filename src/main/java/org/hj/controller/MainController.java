package org.hj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	//배송 상태 페이지
	@GetMapping("/dlvS")
	public String deliveryState() {
		return "deliveryState";
	}
	
	//주문 내역 페이지
	@GetMapping("/OList")
	public String orderList() {
		return "orderList";
	}
	
	//출하 관리 페이지
	@GetMapping("/ship")
	public String shipment() {
		return "shipment";
	}
	
	
}
