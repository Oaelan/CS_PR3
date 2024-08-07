package org.hj.service.Sub;

import java.util.List;

import org.hj.mapper.sub.ProductReSub_Mapper;
import org.hj.model.FactoryTempDto;
import org.hj.model.Product_manufacturingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ProductReSub_ServiceImpl implements ProductReSub_Service {
	
	@Autowired
	ProductReSub_Mapper prsm;
	
	public int addPno(Product_manufacturingDto pmd) {
		return prsm.addPno(pmd);
	}
	
	public List <Product_manufacturingDto> productsInfo(){
		return prsm.productsInfo();
	}
	
	public List <FactoryTempDto> selectFactoryTemp(){
		return prsm.selectFactoryTemp();
	}
	
	public void uploadProductInfo(Product_manufacturingDto pmd){
		prsm.uploadProductInfo(pmd);
	}
	public List <Product_manufacturingDto> selectProductInfo(){
		return prsm.selectProductInfo();
	}
	public List <FactoryTempDto> selectTempDate(){
		return prsm.selectTempDate();
	}
	
	public List<FactoryTempDto> selectTempByDate(FactoryTempDto ptd){
		return prsm.selectTempByDate(ptd);
	}
}
