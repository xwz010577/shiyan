package com.cqust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.salebillMapper;
import com.cqust.model.salebill;

@Service
public class SaleBillServiceImp implements SaleBillService {
	@Autowired
	private salebillMapper salebillMapper;
	@Override
	public List<salebill> selectAll(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return this.salebillMapper.selectByExample(page, limit);
	}

	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.salebillMapper.countByExample(null);
	}

	@Override
	public int insertSale(salebill salebill) {
		// TODO Auto-generated method stub
		return this.salebillMapper.insert(salebill);
	}

	@Override
	public salebill selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.salebillMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.salebillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(salebill salebill) {
		// TODO Auto-generated method stub
		return this.salebillMapper.updateByPrimaryKeySelective(salebill);
	}

}
