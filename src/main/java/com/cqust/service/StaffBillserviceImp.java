package com.cqust.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqust.dao.staffbillMapper;
import com.cqust.model.staffbill;

@Service("staffBillService")
public class StaffBillserviceImp implements StaffBillService {
	@Autowired
	private staffbillMapper staffbillMapper;

	@Override
	public List<staffbill> selectAll(@Param("page") Integer page,@Param("limit") Integer limit) {
		// TODO Auto-generated method stub
		return this.staffbillMapper.selectByExample( page, limit);
	}

	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.staffbillMapper.countByExample();
	}

	@Override
	public int insertStaff(staffbill staffbill) {
		// TODO Auto-generated method stub
		return this.staffbillMapper.insertSelective(staffbill);
	}

	@Override
	public staffbill selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		
		return this.staffbillMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return this.staffbillMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(staffbill staffbill) {
		// TODO Auto-generated method stub
		return this.staffbillMapper.updateByPrimaryKeySelective(staffbill);
	}

}
