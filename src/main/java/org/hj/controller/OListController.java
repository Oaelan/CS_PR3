package org.hj.controller;

import java.util.List;

import org.hj.model.OListDto;
import org.hj.service.Pub.OListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class OListController {
	
	@Autowired
	OListService ols;
	
	//전체 주문 내역
	@GetMapping("/getOList")
		public List<OListDto> getOList() {
	        return ols.getOList();
	    }
	
	//상세 주문 내역(모달창)
	@GetMapping("/getOListDetail")
	public ResponseEntity<OListDto> getOListDetail(@RequestParam String o_no) {
        OListDto orderDetail = ols.getOListDetail(o_no);
		System.out.println(orderDetail);
        return ResponseEntity.ok(orderDetail);
    }
	
}
