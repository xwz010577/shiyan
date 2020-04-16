package com.cqust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.merchbillMapper;
import com.cqust.model.merchbill;

@Service
public class MerchBillServiceImp implements MerchBillService {

	@Autowired
	private merchbillMapper merchbillMapper;
	@Override
	public List<merchbill> selectAll(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return this.merchbillMapper.selectByExample(page,limit);
	}

	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.merchbillMapper.countByExample(null);
	}

	@Override
	public int insertMerch(merchbill merchbill) {
		// TODO Auto-generated method stub
		return this.merchbillMapper.insert(merchbill);
	}

	@Override
	public merchbill selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.merchbillMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.merchbillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(merchbill merchbill) {
		// TODO Auto-generated method stub
		return this.merchbillMapper.updateByPrimaryKeySelective(merchbill);
	}

	@Override
	public List<merchbill> selectBykind(String kind) {
		// TODO Auto-generated method stub
		return this.merchbillMapper.selectBykind(kind);
	}

}
