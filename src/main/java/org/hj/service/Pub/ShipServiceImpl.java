package org.hj.service.Pub;

import java.util.List;

import org.hj.mapper.pub.ShipMapper;
import org.hj.model.DeliveryDto;
import org.hj.model.OListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShipServiceImpl implements ShipService{
	
	@Autowired
	ShipMapper sm;
	
	public List<OListDto> getshipInfo(){
		return sm.getshipInfo();
	}
	
	
	public void putDlvInfo(DeliveryDto ddt) {
		sm.putDlvInfo(ddt);
	}

}
