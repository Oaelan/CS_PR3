package org.hj.service.Pub;

import java.util.ArrayList;

import org.hj.model.Product_manufacturingDto;

public interface ProductRePub_Service {
	public void uploadP(Product_manufacturingDto pmd);
	public  ArrayList <Product_manufacturingDto> productList();
}
