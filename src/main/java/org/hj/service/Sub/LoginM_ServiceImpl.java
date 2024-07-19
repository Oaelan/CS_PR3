package org.hj.service.Sub;


import org.hj.mapper.sub.LoginM_Mapper;
import org.hj.model.MasterDto;
import org.hj.model.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LoginM_ServiceImpl implements LoginM_Service {

	@Autowired
	LoginM_Mapper lmm;
	
	public MasterDto loginM(UserDto ud) {
		return lmm.loginM(ud);

	}

}
