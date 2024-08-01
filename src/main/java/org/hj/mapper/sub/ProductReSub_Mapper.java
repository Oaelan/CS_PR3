package org.hj.mapper.sub;

import java.util.List;

import org.hj.model.FactoryTempDto;
import org.hj.model.Product_manufacturingDto;

public interface ProductReSub_Mapper {
	// 상품 번호 가져오기
	public int addPno(Product_manufacturingDto pmd);
	
	// productCode에 있는 상품 정보 들고오기
	public List <Product_manufacturingDto> productsInfo();
	
	// 물류 창고 온도 가져오기
	public List <FactoryTempDto> selectFactoryTemp();
	
	// 물류 창고 온도 가져오기
	public void uploadProductInfo(Product_manufacturingDto pmd);
	
	// 등록된 상품 정보 들고오기
	public List <Product_manufacturingDto> selectProductInfo();
	
	//온도 데이터의 년/월/일 만들고 오기 (겹치면 1개만 들고옴)
	public List<FactoryTempDto> selectTempDate();
	
	// 선택한 날짜 온도 데이터 출력
	public List<FactoryTempDto> selectTempByDate(FactoryTempDto ptd);
}
