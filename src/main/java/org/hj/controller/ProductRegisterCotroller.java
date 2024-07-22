package org.hj.controller;

import org.hj.model.Product_manufacturingDto;
import org.hj.service.Pub.ProductRePubService;
import org.hj.service.Sub.ProductReSubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductRegisterCotroller {

	@Autowired
	ProductReSubService prss;
	
	@Autowired
	ProductRePubService prps;
	
		// 상품등록 컨트롤러
		@PostMapping("/upload")
		public String LoginM(Product_manufacturingDto pmd) {
			System.out.println("상품등록 컨트롤러");
			// 상품 등록시 해당 상품 코드 번호 가져오기
			int p_no = prss.addPno(pmd);
			pmd.setP_no(p_no);		
			prps.productRegister(pmd);
			// 상품 등록 관련 로직 
			return "redirect:/productRegister";
		}

}
