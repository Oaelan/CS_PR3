package org.hj.service.Pub;

import java.util.ArrayList;

import org.hj.mapper.pub.ProductRePub_Mapper;
import org.hj.model.Product_manufacturingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ProductRePub_ServiceImpl implements ProductRePub_Service {
	@Autowired
	ProductRePub_Mapper prpm;
	public void uploadP(Product_manufacturingDto pmd) {
		prpm.uploadP(pmd);
	}
	
	public  ArrayList <Product_manufacturingDto> productList(){
		return prpm.productList();
	}

}
