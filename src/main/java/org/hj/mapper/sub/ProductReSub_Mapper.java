package org.hj.mapper.sub;

import java.util.List;

import org.hj.model.Product_manufacturingDto;

public interface ProductReSub_Mapper {
	// 상품 번호 가져오기
	public int addPno(Product_manufacturingDto pmd);
	
	// productCode에 있는 상품 정보 들고오기
	public List <Product_manufacturingDto> productsInfo();
}
