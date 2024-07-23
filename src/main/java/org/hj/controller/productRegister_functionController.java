package org.hj.controller;

import java.util.List;

import org.hj.model.Product_manufacturingDto;
import org.hj.service.Pub.ProductRePub_Service;
import org.hj.service.Sub.ProductReSub_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product")
public class productRegister_functionController {
	@Autowired //public_schema
	ProductRePub_Service prps;
	@Autowired //Supplier
	ProductReSub_Service prss;
	
	//productCode테이블의 정보 가져오기
	@GetMapping("productsInfo")
	public List<Product_manufacturingDto> productsInfo() {
		List<Product_manufacturingDto> productsInfos = prss.productsInfo();
		// System.out.println(prps.productList());
		return productsInfos;
	}
	
	
	// 등록되어 있는 상품들 가져오기 productNum 뷰 이용
	@GetMapping("list")
	public List<Product_manufacturingDto> productList() {
		List<Product_manufacturingDto> productLists = prps.productList();
		// System.out.println(prps.productList());
		return productLists;
	}

	// 선택한 상품의 상품번호로 유통기한별 재고 정보 가져오기
	@GetMapping("groupByDate")
	public List<Product_manufacturingDto> groupByDate(
			Product_manufacturingDto pmd, @RequestParam("p_no") String p_no) {
		int productNo = Integer.parseInt(p_no); // String을 int로 변환
		pmd.setP_no(productNo);
		List<Product_manufacturingDto> groupByDateList = prps.groupByDate(pmd);
		// System.out.println(groupByDateList);
		return groupByDateList;
	}

	// 재고 수정 기능
	@PostMapping(value = "/updateStock", produces = "application/json;charset=UTF-8")
		public String updateStock(Product_manufacturingDto pmd, @RequestBody List<Product_manufacturingDto> udateProducts){
			// 리스트는 length가 아니라 size로 길이 구함
			for(int i=0;i<udateProducts.size();i++){
				//쿼리문에 보낼 객체 초기화하기
				pmd.setP_no(udateProducts.get(i).getP_no());
				pmd.setM_date(udateProducts.get(i).getM_date());
				pmd.setP_limitD(udateProducts.get(i).getP_limitD());
				pmd.setM_num(udateProducts.get(i).getM_num());
				System.out.println(pmd);
			// 실행시킬 쿼리 메서드에 초기화시킨 객체 넣기 
				prps.updateStock(pmd);
			}
			// JSON 문자열 직접 작성하여 응답 반환(써먹짜!!!!!!!!!!!!!)
			return "{\"message\": \"재고 수정 완료\"}";
	}
	
	//재고 수정 기능
		@PostMapping(value = "/disposeStock", produces = "application/json;charset=UTF-8")
			public String disposeStock(Product_manufacturingDto pmd, @RequestBody List<Product_manufacturingDto> disposeProducts){
				// 리스트는 length가 아니라 size로 길이 구함
				for(int i=0;i<disposeProducts.size();i++){
					//쿼리문에 보낼 객체 초기화하기
					pmd.setP_no(disposeProducts.get(i).getP_no());
					pmd.setM_date(disposeProducts.get(i).getM_date());
					pmd.setP_limitD(disposeProducts.get(i).getP_limitD());
					pmd.setM_num(disposeProducts.get(i).getM_num());
					System.out.println(pmd);
				// 실행시킬 쿼리 메서드에 초기화시킨 객체 넣기 
					prps.disposeStock(pmd);
				}
				// JSON 문자열 직접 작성하여 응답 반환(써먹짜!!!!!!!!!!!!!)
				return "{\"message\": \"재고 폐기 완료\"}";
		}



}
