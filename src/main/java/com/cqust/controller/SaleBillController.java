package com.cqust.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;
import com.cqust.model.Result;
import com.cqust.model.merchbill;
import com.cqust.model.salebill;
import com.cqust.model.storebill;
import com.cqust.service.MerchBillService;
import com.cqust.service.SaleBillService;
import com.cqust.service.StoreBillService;

@SessionAttributes(value = {"salebillsp"})
@Controller
public class SaleBillController {
	@Autowired
	private SaleBillService saleBillService;
	@Autowired
	private MerchBillService merchBillService;
	@Autowired
	private StoreBillService storeBillService;
	
	/*跳转销售信息界面*/
	@RequestMapping("/tosalebill")
	public String tosaleBill(HttpSession session){
		return "salemain";
		
	}
	/*查询销售所有信息*/
	@RequestMapping("/toSelectAllsale")
	@ResponseBody
	public Result<salebill> selectAll(Integer page,Integer limit,String saleid,Model model,HttpSession session) {
		Result<salebill> result=new Result<>();
		List<salebill> data=new ArrayList<salebill>();
		/*根据id查询*/
		if (saleid!=null && saleid.trim().length()!=0) {
			salebill str=selectByid(saleid);
			if (str==null) {
				result.setCode(200);
				result.setMsg("暂无该数据！！！");
			}
			data.add(str);
			result.setData(data);
		}else {
			 data=this.saleBillService.selectAll((page-1)*10,limit);
			 
			 model.addAttribute("salebillsp",JSON.toJSONString(data));
			result.setData(data);
		}
		long count=this.saleBillService.selectCount();
		result.setCount(count);
		return result;
	}
	/*添加新销售
	 * @param sale 新销售信息
	 * @throw sale 如果为空 则抛出异常
	 * */
	@RequestMapping("/toInsertsale")
	@ResponseBody
	public int  insertsale(salebill salebill) {
		int res=0;
		if (salebill==null) {
			 throw new NullPointerException();
		}
		salebill salebill2=selectByid(salebill.getSalebillid());
		if (salebill2!=null) {
			return res;
		}else {
			//查询库存
			storebill storebill=this.storeBillService.selectByPrimaryKey(salebill.getMerchid());
			if (storebill!=null) {
				storebill.setStorenum(storebill.getStorenum()-salebill.getSalenum());
				//减少库存
				this.storeBillService.updateByPrimaryKeySelective(storebill);
				res=this.saleBillService.insertSale(salebill);
				//若卖完
				if (storebill.getStorenum()==0) {
					this.storeBillService.deleteByPrimaryKey(salebill.getMerchid());
				}
			}
			return res;
		}
		
	}
	/*跳转销售信息添加界面*/
	@RequestMapping("/toinsertSaleBill")
	public String  toinsertSaleBill(Model model){
		List<merchbill> merchbill=this.merchBillService.selectAll(null, null);
		model.addAttribute("merchbill", merchbill);
		return "insertSaleBill";
	}
	/*跳转销售信息编辑界面*/
	@RequestMapping("/toupdateSaleBill")
	public String  toupdatesaleBill(String  saleid,Model model){
		salebill salebill=this.saleBillService.selectByPrimaryKey(saleid);
		model.addAttribute("sale", salebill);
		return "updateSaleBill";
	}
	/*编辑销售信息*/
	@RequestMapping("/toEditSale")
	@ResponseBody
	public int toEditsale(salebill salebill){
		if (salebill==null) {
			throw new NullPointerException();
		}
		int res =this.saleBillService.updateByPrimaryKeySelective(salebill);
		return res;
		
	}
	/*根据id查询信息
	 * @param id 销售id
	 * @throw null 没有该销售
	 * */
	public  salebill selectByid(String  saleid) {
		if (saleid==null) {
			throw new NullPointerException();
		}
		salebill salebill=this.saleBillService.selectByPrimaryKey(saleid);
		if (salebill!=null) {
			return salebill;
		}
		return null;
	}
	/*根据id删除信息
	 * @param id 销售id
	 * @throw null 没有该销售
	 * */
	@RequestMapping("/toDelSale")
	@ResponseBody
	public  int delByid(String  saleid) {
		if (saleid==null) {
			return 0;
		}
		int res=this.saleBillService.deleteByPrimaryKey(saleid);
		return res;
	}
	
	//根据商品id查询库存数量
	@RequestMapping("/tomerchid")
	@ResponseBody
	public String toselectmerchid(String id){
		if (id!=null) {
			storebill storebill=storeBillService.selectByPrimaryKey(id);
			if (storebill!=null) {
				return (String.valueOf(storebill.getStorenum()));
			}
			return "false";
		}
		return "fasle";
	}
	
}
