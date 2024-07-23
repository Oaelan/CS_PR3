package org.hj.mapper.pub;

import java.util.ArrayList;

import org.hj.model.Product_manufacturingDto;

public interface ProductRePub_Mapper {
	// 상품 등록
	public void uploadP(Product_manufacturingDto pmd);
	// 상품 리스트 가져오기
	public ArrayList<Product_manufacturingDto> productList();

	// 유통기한별 등록되어 있는 상품 정보 들고오기
	public ArrayList<Product_manufacturingDto> groupByDate(
			Product_manufacturingDto pmd);

	// 재고 수정하기
	public void updateStock(Product_manufacturingDto pmd);
}
