package org.hj.mapper.pub;

import java.util.List;

import org.hj.model.DeliveryDto;
import org.hj.model.OListDto;

public interface ShipMapper {

	public List<OListDto> getshipInfo();
	
	public void putDlvInfo(DeliveryDto ddt);
}
