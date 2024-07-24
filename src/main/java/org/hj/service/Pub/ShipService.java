package org.hj.service.Pub;


import java.util.List;

import org.hj.model.DeliveryDto;
import org.hj.model.OListDto;

public interface ShipService {

	public List<OListDto> getshipInfo();
	
	public void putDlvInfo(DeliveryDto ddt);
}
