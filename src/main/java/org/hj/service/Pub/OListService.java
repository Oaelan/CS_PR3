package org.hj.service.Pub;

import java.util.List;
import java.util.Map;

import org.hj.model.OListDto;



public interface OListService {

	public List<OListDto> getOList();
	
	public List<OListDto> getOListDetail(String o_no);
	
	public void rejectOrder(Map<String, String> params);
	
	public void acceptOrder(String o_no);
	
	public void deleteProduct(OListDto delete);
	
}
