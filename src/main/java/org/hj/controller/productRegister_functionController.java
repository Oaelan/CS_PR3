package org.hj.controller;

import java.util.ArrayList;
import java.util.List;

import org.hj.model.Product_manufacturingDto;
import org.hj.service.Pub.ProductRePub_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product")
public class productRegister_functionController {
	@Autowired
	ProductRePub_Service prps;
	
	// 등록되어 있는 상품들 가져오기 productNum 뷰 이용
	@GetMapping("list")
	public List <Product_manufacturingDto> productList(){
		List <Product_manufacturingDto> productLists = prps.productList();
		//System.out.println(prps.productList());
		return productLists;
	}
	
	// 선택한 상품의 상품번호로 유통기한별 재고 정보 가져오기
	@GetMapping("groupByDate")
	public List <Product_manufacturingDto> groupByDate(Product_manufacturingDto pmd, @RequestParam("p_no") String p_no){
		int productNo = Integer.parseInt(p_no); // String을 int로 변환
		pmd.setP_no(productNo);
		List <Product_manufacturingDto> groupByDateList = prps.groupByDate(pmd);
		System.out.println(groupByDateList);
		return groupByDateList;
	}
	

	
}
