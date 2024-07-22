package org.hj.service.Sub;

import org.hj.mapper.sub.ProductReSub_Mapper;
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

}
