package org.hj.service.Sub;

import org.hj.mapper.sub.ProductReSubMapper;
import org.hj.model.Product_manufacturingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductReSubServiceImpl implements ProductReSubService {
	@Autowired
	ProductReSubMapper prsm;

	public int addPno(Product_manufacturingDto pmd) {
		return prsm.addPno(pmd);
	}

}
