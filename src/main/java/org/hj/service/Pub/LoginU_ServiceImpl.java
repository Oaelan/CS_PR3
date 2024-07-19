package org.hj.service.Pub;


import org.hj.mapper.pub.LoginU_Mapper;
import org.hj.model.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginU_ServiceImpl implements LoginU_Service {

	@Autowired
	LoginU_Mapper lum;

	public UserDto loginU(UserDto ud) {
		return lum.loginU(ud);
	};
}
