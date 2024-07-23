package org.hj.service.Sub;

import java.util.List;

import org.hj.model.Product_manufacturingDto;

public interface ProductReSub_Service {
	public int addPno(Product_manufacturingDto pmd);
	public List <Product_manufacturingDto> productsInfo();


}
