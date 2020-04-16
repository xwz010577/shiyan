package com.cqust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.profferbillMapper;
import com.cqust.model.profferbill;

@Service("profferBillService")
public class ProfferBillServiceImp implements ProfferBillService {

	@Autowired
	private profferbillMapper profferbillMapper;
	@Override
	public List<profferbill> selectAll(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return this.profferbillMapper.selectByExample(page, limit);
	}

	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.profferbillMapper.countByExample();
	}

	@Override
	public int insertProff(profferbill profferbill) {
		// TODO Auto-generated method stub
		return this.profferbillMapper.insert(profferbill);
	}

	@Override
	public profferbill selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.profferbillMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.profferbillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(profferbill profferbill) {
		// TODO Auto-generated method stub
		return this.profferbillMapper.updateByPrimaryKeySelective(profferbill);
	}

	@Override
	public List<profferbill> selectCondition(profferbill profferbill) {
		// TODO Auto-generated method stub
		return this.profferbillMapper.selectCondition(profferbill);
	}

}
