package com.cqust.service;

import com.cqust.model.userbill;

public interface UserBillService {
	public userbill login(userbill userbill);
	public int updatePassword(userbill userbill);
}
