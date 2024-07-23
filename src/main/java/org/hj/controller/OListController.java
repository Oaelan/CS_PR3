package org.hj.controller;

import java.util.List;

import org.hj.model.OListDto;
import org.hj.service.Pub.OListService;
import org.springframework.beans.factory.annotation.Autowired;
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
	public List<OListDto> getOListDetail(@RequestParam("o_no") String o_no) {
        List<OListDto> orderDetail = (List<OListDto>)ols.getOListDetail(o_no);
        return orderDetail;
    }
	
	//수주 거절
	@GetMapping("/rejectOrder")
	public void rejectOrder(@RequestParam("o_no") String o_no) {
		ols.rejectOrder(o_no);
	   }
	
	//수주 수락
	@GetMapping("/acceptOrder")
	public void acceptOrder(@RequestParam("o_no") String o_no) {
		ols.acceptOrder(o_no);
	}
}
