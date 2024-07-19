package org.hj.service;

import org.hj.mapper.LoginM_Mapper;
import org.hj.model.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LoginM_ServiceImpl implements LoginM_Service {

	@Autowired
	LoginM_Mapper lmm;
	
	public UserDto loginM(UserDto ud) {
		return lmm.loginM(ud);

	}

}
