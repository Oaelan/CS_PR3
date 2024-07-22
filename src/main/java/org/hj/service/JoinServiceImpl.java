package org.hj.service;

import org.hj.mapper.pub.JoinMapper;
import org.hj.model.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService{
	
	@Autowired
	JoinMapper jm;
	
	public void JoinPut(UserDto udt) {
		System.out.println(udt);
		jm.JoinPut(udt);
	}
}
