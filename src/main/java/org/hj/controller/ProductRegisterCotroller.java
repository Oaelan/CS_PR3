package org.hj.controller;

import org.hj.model.Product_manufacturingDto;
import org.hj.service.Pub.ProductRePub_Service;
import org.hj.service.Sub.ProductReSub_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductRegisterCotroller {

	
	// 상품 등록시 번호 가져오는 서비스
	@Autowired
	ProductReSub_Service  prss;
	
	//상품 등록 서비스
	@Autowired
	ProductRePub_Service prps;
	
		// 상품등록 컨트롤러
		@PostMapping("/upload")
		public String upload(Product_manufacturingDto pmd) {
			System.out.println("상품등록 컨트롤러");
			// 상품 등록시 해당 상품 코드 번호 가져오기
			int p_no = prss.addPno(pmd);
			pmd.setP_no(p_no);		
			prps.uploadP(pmd);			
			// 상품 등록 관련 로직 
			return "redirect:/productRegister";
		}

		// 신상품 등록 컨트롤러
		@GetMapping("/uploadProductInfo")
		public String uploadInfo(Product_manufacturingDto pmd) {
			System.out.println("신상품 등록 컨트롤러");
			prss.uploadProductInfo(pmd);
			// 상품 등록 관련 로직 
			return "redirect:/productRegister";
		}	
			
		

}
