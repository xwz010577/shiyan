package com.cqust.service;

import java.util.List;

import com.cqust.model.merchbill;

public interface MerchBillService {
	public List<merchbill> selectAll( Integer page,Integer limit);
	public long selectCount();
	public int insertMerch(merchbill merchbill);
	public merchbill selectByPrimaryKey(String id);
	public int deleteByPrimaryKey(String id);
	public int updateByPrimaryKeySelective(merchbill merchbill);
	List<merchbill> selectBykind(String kind);
}
