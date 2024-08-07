package org.hj.service.Sub;

import java.util.List;

import org.hj.model.FactoryTempDto;
import org.hj.model.Product_manufacturingDto;

public interface ProductReSub_Service {
	public int addPno(Product_manufacturingDto pmd);
	public List <Product_manufacturingDto> productsInfo();
	public List <FactoryTempDto> selectFactoryTemp();
	public void uploadProductInfo(Product_manufacturingDto pmd);
	public List <Product_manufacturingDto> selectProductInfo();
	public List <FactoryTempDto> selectTempDate();
	public List<FactoryTempDto> selectTempByDate(FactoryTempDto ptd);

}
