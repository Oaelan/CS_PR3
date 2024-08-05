package org.hj.service.Pub;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	
	public List<OListDto> getOListDetail(String o_no){
		return olm.getOListDetail(o_no);
	}
	
	public void rejectOrder(Map<String, String> params) {
		olm.rejectOrder(params);
	}
	
	public void acceptOrder(String o_no) {
		olm.acceptOrder(o_no);
	}
	

	public void deleteProduct(OListDto delete) {
		olm.deleteProduct(delete);
	}
}
