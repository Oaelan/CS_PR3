package org.hj.mapper.pub;

import java.util.List;

import org.hj.model.OListDto;

public interface OListMapper {

	public List<OListDto> getOList();
	
	public OListDto getOListDetail(String o_no);
	
}
