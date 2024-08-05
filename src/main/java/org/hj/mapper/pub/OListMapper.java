package org.hj.mapper.pub;

import java.util.List;
import java.util.Map;

import org.hj.model.OListDto;

public interface OListMapper {

	public List<OListDto> getOList();
	
	public List<OListDto> getOListDetail(String o_no);
	
	public void rejectOrder(Map<String, String> params);
	
	public void acceptOrder(String o_no);
	
	public void deleteProduct(OListDto delete);
	
}
