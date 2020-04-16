package com.cqust.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqust.model.Result;
import com.cqust.model.importbill;
import com.cqust.model.merchbill;
import com.cqust.service.ImportBillService;
import com.cqust.service.MerchBillService;

@Controller
public class ImportBillController {
	@Autowired
	private ImportBillService importBillService;
	@Autowired
	private MerchBillService merchBillService;
	
	/*跳转进货信息界面*/
	@RequestMapping("/toImportbill")
	public String toimportBill(){
		return "importMain";
		
	}
	/*查询进货所有信息*/
	@RequestMapping("/toSelectAllImport")
	@ResponseBody
	public Result<importbill> selectAll(Integer page,Integer limit,String importid,Model mode) {
		Result<importbill> result=new Result<>();
		List<importbill> data=new ArrayList<importbill>();
		/*根据id查询*/
		if (importid!=null && importid.trim().length()!=0) {
			importbill str=selectByid(importid);
			if (str==null) {
				result.setCode(200);
				result.setMsg("暂无该数据！！！");
			}
			data.add(str);
			result.setData(data);
		}else {
			 data=this.importBillService.selectAll((page-1)*10,limit);
			result.setData(data);
		}
		long count=this.importBillService.selectCount();
		result.setCount(count);
		return result;
	}
	/*添加新进货
	 * @param import 新进货信息
	 * @throw import 如果为空 则抛出异常
	 * */
	@RequestMapping("/toinsertImport")
	@ResponseBody
	public int  insertimport(importbill importbill) {
		if (importbill==null) {
			 throw new NullPointerException();
		}
		int res=0;
		importbill importbill2=selectByid(importbill.getImortbillid());
		if (importbill2!=null) {
			return res;
		}
		 res=this.importBillService.insertImport(importbill);
		return res;
	}
	/*跳转进货信息添加界面*/
	@RequestMapping("/toinsertImportBill")
	public String  toinsertImportBill(Model model){
		List<merchbill> merchbill=this.merchBillService.selectAll(null, null);
		List<importbill> importbills=this.importBillService.selectAll(null, null);
			model.addAttribute("sjzs", importbills.size());
		model.addAttribute("merchbill", merchbill);
		model.addAttribute("importbills", importbills);
		return "insertImportBill";
	}
	/*根据商品id查询供应商id*/
	@RequestMapping("/toselectmerchid")
	@ResponseBody
	public String toselectmerchid(String id){
		if (id!=null) {
			merchbill profferbill=merchBillService.selectByPrimaryKey(id);
			return profferbill.getProfferid();
		}
		return "false";
		
	}
	/*跳转进货信息编辑界面*/
	@RequestMapping("/toupdateImportBill")
	public String  toupdateImportBill(String  importid,Model model){
		importbill importbill=this.importBillService.selectByPrimaryKey(importid);
		model.addAttribute("importbill", importbill);
		model.addAttribute("s",	 "we");
		return "updateImportBill";
	}
	/*编辑进货信息*/
	@RequestMapping("/toEditImport")
	@ResponseBody
	public int toEditimport(importbill importbill){
		if (importbill==null) {
			throw new NullPointerException();
		}
		int res =this.importBillService.updateByPrimaryKeySelective(importbill);
		return res;
		
	}
	/*根据id查询信息
	 * @param id 进货id
	 * @throw null 没有该清单
	 * */
	public  importbill selectByid(String  importid) {
		if (importid==null) {
			throw new NullPointerException();
		}
		importbill importbill=this.importBillService.selectByPrimaryKey(importid);
		if (importbill!=null) {
			return importbill;
		}
		return null;
	}
	/*根据id删除信息
	 * @param id 进货id
	 * @throw null 没有该清单
	 * */
	@RequestMapping("/toDelImport")
	@ResponseBody
	public  int delByid(String  importid) {
		System.out.println(importid);
		if (importid==null) {
			return 0;
		}
		int res=this.importBillService.deleteByPrimaryKey(importid);
		return res;
	}

}
