package org.hj.service.Pub;

import java.util.List;

import org.hj.mapper.pub.OListMapper;
import org.hj.model.OListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OListServiceImpl implements OListService{
	
	@Autowired
	OListMapper olm;
	
	public List<OListDto> getOList(){
		return olm.getOList();
	}

}
