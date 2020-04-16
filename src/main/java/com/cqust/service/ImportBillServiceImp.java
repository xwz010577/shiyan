package com.cqust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.importbillMapper;
import com.cqust.model.importbill;

@Service
public class ImportBillServiceImp implements ImportBillService {

	@Autowired
	private importbillMapper importbillMapper;
	@Override
	public List<importbill> selectAll(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return this.importbillMapper.selectByExample(page,limit);
	}

	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.importbillMapper.countByExample(null);
	}

	@Override
	public int insertImport(importbill importbill) {
		// TODO Auto-generated method stub
		return this.importbillMapper.insert(importbill);
	}

	@Override
	public importbill selectByPrimaryKey(String imortbillid) {
		// TODO Auto-generated method stub
		return this.importbillMapper.selectByPrimaryKey(imortbillid);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.importbillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(importbill importbill) {
		// TODO Auto-generated method stub
		return this.importbillMapper.updateByPrimaryKeySelective(importbill);
	}

}
