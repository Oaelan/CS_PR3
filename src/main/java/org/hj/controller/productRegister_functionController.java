package org.hj.controller;

import java.util.ArrayList;
import java.util.List;

import org.hj.model.Product_manufacturingDto;
import org.hj.service.Pub.ProductRePub_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product")
public class productRegister_functionController {
	@Autowired
	ProductRePub_Service prps;
	
	
	@GetMapping("list")
	public List <Product_manufacturingDto> productList(){
		List <Product_manufacturingDto> productLists = prps.productList();
		System.out.println(prps.productList());
		return productLists;
	}
	

	
}
