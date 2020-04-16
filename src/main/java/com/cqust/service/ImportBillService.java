package com.cqust.service;

import java.util.List;

import com.cqust.model.importbill;


public interface ImportBillService {
	public List<importbill> selectAll( Integer page,Integer limit);
	public long selectCount();
	public int insertImport(importbill importbill);
	public importbill selectByPrimaryKey(String id);
	public int deleteByPrimaryKey(String id);
	public int updateByPrimaryKeySelective(importbill importbill);
}
