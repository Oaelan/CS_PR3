package org.hj.service.Pub;

import java.util.List;

import org.hj.mapper.pub.DlvStateMapper;
import org.hj.model.DeliveryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DlvStateServiceImpl implements DlvStateService{

	@Autowired
	DlvStateMapper dsm;
	
	@Override
	public List<DeliveryDto> getDlvState(){
		System.out.println(dsm.getDlvState());
		return dsm.getDlvState();
	}
}
