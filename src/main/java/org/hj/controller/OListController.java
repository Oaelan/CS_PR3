package org.hj.controller;

import java.util.List;

import org.hj.model.OListDto;
import org.hj.service.Pub.OListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class OListController {
	
	@Autowired
	OListService ols;
	
	@GetMapping("/getOList")
		public List<OListDto> getOList() {
		System.out.println(ols.getOList());
	        return ols.getOList();
	    }
	
}
