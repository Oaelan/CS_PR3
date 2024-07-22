package org.hj.service.Pub;

import org.hj.mapper.pub.ProductRePubMapper;
import org.hj.model.Product_manufacturingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ProductRePubServiceImpl implements ProductRePubService{
	
	@Autowired
	ProductRePubMapper prpm;
	
	public void productRegister(Product_manufacturingDto pmd) {
		prpm.productRegister(pmd);
	}

}
