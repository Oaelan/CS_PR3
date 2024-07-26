package org.hj.controller;

import java.util.List;

import org.hj.model.DeliveryDto;
import org.hj.service.Pub.DlvStateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class DlvStateController {

	@Autowired
	private DlvStateService ds;
	
	@GetMapping("/getDlvState")
	public List<DeliveryDto> getDlvState() {
		System.out.println(ds.getDlvState());
		return ds.getDlvState();
	}
}
