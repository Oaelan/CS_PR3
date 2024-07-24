package org.hj.controller;

import java.util.List;

import org.hj.model.DeliveryDto;
import org.hj.model.OListDto;
import org.hj.service.Pub.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ShipController {

	@Autowired
	ShipService ss;

	//출하 내용 가져오기
	@GetMapping("/getshipInfo")
	public List<OListDto> getshipInfo() {
        return ss.getshipInfo();
    }
	
	//출하 시작 데이터 입력
	@PostMapping("/putDlvInfo")
	public void putDlvInfo(@RequestBody List<DeliveryDto> delivery) {
		System.out.println(delivery);
		for (DeliveryDto ddt : delivery) {
			ss.putDlvInfo(ddt);
		}
    }
	
	
}
