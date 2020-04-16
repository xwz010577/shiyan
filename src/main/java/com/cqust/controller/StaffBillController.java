package com.cqust.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqust.model.Result;
import com.cqust.model.staffbill;
import com.cqust.service.StaffBillService;

@Controller
public class StaffBillController {
	@Autowired
	private StaffBillService staffBillService;
	
	/*跳转员工信息界面*/
	@RequestMapping("/tostaffbill")
	public String toStaffBill(){
		return "staffmain";
		
	}
	/*查询员工所有信息*/
	@RequestMapping("/toSelectAllStaff")
	@ResponseBody
	public Result<staffbill> selectAll(Integer page,Integer limit,String staffid,Model mode) {
		Result<staffbill> result=new Result<>();
		List<staffbill> data=new ArrayList<staffbill>();
		/*根据id查询*/
		if (staffid!=null && staffid.trim().length()!=0) {
			staffbill str=selectByid(staffid);
			if (str==null) {
				result.setCode(200);
				result.setMsg("暂无该数据！！！");
			}
			data.add(str);
			result.setData(data);
		}else {
			 data=this.staffBillService.selectAll((page-1)*10,limit);
			result.setData(data);
		}
		long count=this.staffBillService.selectCount();
		result.setCount(count);
		return result;
	}
	/*添加新员工
	 * @param staff 新员工信息
	 * @throw staff 如果为空 则抛出异常
	 * */
	@RequestMapping("/toInsertStaff")
	@ResponseBody
	public int  insertStaff(staffbill staffbill) {
		if (staffbill==null) {
			 throw new NullPointerException();
		}
		
		int res=this.staffBillService.insertStaff(staffbill);
		return res;
	}
	/*跳转员工信息添加界面*/
	@RequestMapping("/toinsertStaffBill")
	public String  toinsertStaffBill(){
		return "insertStaffBill";
	}
	/*跳转员工信息编辑界面*/
	@RequestMapping("/toupdateStaffBill")
	public String  toupdateStaffBill(String  staffid,Model model){
		staffbill staffbill=this.staffBillService.selectByPrimaryKey(staffid);
		model.addAttribute("staff", staffbill);
		return "updateStaffBill";
	}
	/*编辑员工信息*/
	@RequestMapping("/toEditStaff")
	@ResponseBody
	public int toEditStaff(staffbill staffbill){
		if (staffbill==null) {
			throw new NullPointerException();
		}
		int res =this.staffBillService.updateByPrimaryKeySelective(staffbill);
		return res;
		
	}
	/*根据id查询信息
	 * @param id 员工id
	 * @throw null 没有该用户
	 * */
	public  staffbill selectByid(String  staffid) {
		if (staffid==null) {
			throw new NullPointerException();
		}
		staffbill staffbill=this.staffBillService.selectByPrimaryKey(staffid);
		if (staffbill!=null) {
			return staffbill;
		}
		return null;
	}
	/*根据id删除信息
	 * @param id 员工id
	 * @throw null 没有该用户
	 * */
	@RequestMapping("/toDelStaff")
	@ResponseBody
	public  int delByid(String  staffid) {
		if (staffid==null) {
			return 0;
		}
		int res=this.staffBillService.deleteByPrimaryKey(staffid);
		return res;
	}
	
}
