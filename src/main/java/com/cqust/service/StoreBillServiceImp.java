package com.cqust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.storebillMapper;
import com.cqust.model.storebill;

@Service
public class StoreBillServiceImp implements StoreBillService {
	@Autowired
	private storebillMapper storebillMapper;

	@Override
	public List<storebill> selectAll(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return this.storebillMapper.selectByExample(page, limit);
	}

	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.storebillMapper.countByExample(null);
	}

	@Override
	public int insertstore(storebill storebill) {
		// TODO Auto-generated method stub
		return this.storebillMapper.insert(storebill);
	}

	@Override
	public storebill selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.storebillMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.storebillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(storebill storebill) {
		// TODO Auto-generated method stub
		return this.storebillMapper.updateByPrimaryKeySelective(storebill);
	}

}
