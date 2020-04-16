package com.cqust.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.userbillMapper;
import com.cqust.model.userbill;
import com.cqust.service.UserBillService;

@Service("userBillService")
public class UserBillServiceImp implements UserBillService{

	@Autowired
	private userbillMapper userbillMapper;
	public userbill login(userbill userbill) {
		// TODO Auto-generated method stub
		userbill user=this.userbillMapper.login(userbill);
		return user;
	}
	@Override
	public int updatePassword(userbill userbill) {
		// TODO Auto-generated method stub
		return this.userbillMapper.updateByPrimaryKey(userbill);
	}

}
