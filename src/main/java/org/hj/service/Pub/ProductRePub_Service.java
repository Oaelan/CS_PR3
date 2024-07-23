package org.hj.service.Pub;

import java.util.ArrayList;

import org.hj.model.Product_manufacturingDto;

public interface ProductRePub_Service {
	public void uploadP(Product_manufacturingDto pmd);
	public  ArrayList <Product_manufacturingDto> productList();
	public  ArrayList <Product_manufacturingDto> groupByDate(Product_manufacturingDto pmd);
	public void updateStock(Product_manufacturingDto pmd);
	public void disposeStock(Product_manufacturingDto pmd);
}
