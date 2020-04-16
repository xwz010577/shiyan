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
import com.cqust.model.storebill;
import com.cqust.service.ImportBillService;
import com.cqust.service.MerchBillService;
import com.cqust.service.StoreBillService;

@Controller
public class StoreBillController {
	@Autowired
	private StoreBillService storeBillService;
	@Autowired
	private ImportBillService importBillService;
	@Autowired
	private MerchBillService merchBillService;

	/*跳转库存信息界面*/
	@RequestMapping("/tostorebill")
	public String tostoreBill(){
		return "storebillmain";
		
	}
	/*查询库存所有信息*/
	@RequestMapping("/toSelectAllstore")
	@ResponseBody
	public Result<storebill> selectAll(Integer page,Integer limit,String merchid,Model mode) {
		Result<storebill> result=new Result<>();
		List<storebill> data=new ArrayList<storebill>();
		/*根据id查询*/
		if (merchid!=null && merchid.trim().length()!=0) {
			storebill str=selectByid(merchid);
			if (str==null) {
				result.setCode(200);
				result.setMsg("暂无该数据！！！");
			}
			data.add(str);
			result.setData(data);
		}else {
			 data=this.storeBillService.selectAll((page-1)*10,limit);
			result.setData(data);
		}
		long count=this.storeBillService.selectCount();
		result.setCount(count);
		return result;
	}
	/*添加新库存
	 * @param store 新库存信息
	 * @throw store 如果为空 则抛出异常
	 * */
	@RequestMapping("/toInsertstore")
	@ResponseBody
	public int  insertstore(storebill storebill) {
		int res=0;
		if (storebill==null) {
			 throw new NullPointerException();
		}
		storebill storebill2=selectByid(storebill.getMerchid());
		if (storebill2!=null) {
			return res;
		}else {
			res=this.storeBillService.insertstore(storebill);
			return res;
		}
		
	}
	/*跳转库存信息添加界面*/
	@RequestMapping("/toinsertstoreBill")
	public String  toinsertstoreBill(Model model){
		/*List<merchbill> merchbill=this.merchBillService.selectAll(null, null);
		model.addAttribute("merchbill", merchbill);*/
		return "insertstoreBill";
	}
	/*跳转库存信息编辑界面*/
	@RequestMapping("/toupdatestoreBill")
	public String  toupdatestoreBill(String  storeid,Model model){
		storebill storebill=this.storeBillService.selectByPrimaryKey(storeid);
		model.addAttribute("store", storebill);
		return "updatestoreBill";
	}
	/*编辑库存信息*/
	@RequestMapping("/toEditstore")
	@ResponseBody
	public int toEditstore(storebill storebill){
		if (storebill==null) {
			throw new NullPointerException();
		}
		int res =this.storeBillService.updateByPrimaryKeySelective(storebill);
		return res;
		
	}
	/*根据id查询信息
	 * @param id 库存id
	 * @throw null 没有该库存
	 * */
	public  storebill selectByid(String  merchid) {
		if (merchid==null) {
			throw new NullPointerException();
		}
		storebill storebill=this.storeBillService.selectByPrimaryKey(merchid);
		if (storebill!=null) {
			return storebill;
		}
		return null;
	}
	/*根据id删除信息
	 * @param id 库存id
	 * @throw null 没有该库存
	 * */
	@RequestMapping("/toDelstore")
	@ResponseBody
	public  int delByid(String  merchid) {
		if (merchid==null) {
			return 0;
		}
		int res=this.storeBillService.deleteByPrimaryKey(merchid);
		return res;
	}
	/*将进货信息导入库存*/
	@RequestMapping("/todrstore")
	@ResponseBody
	public String todrstore() {
		//获取进货清单
		List<importbill> list=this.importBillService.selectAll(null, null);
		
		if (list.size()!=0) {
			for (importbill str : list) {
				storebill stor=this.selectByid(str.getMerchid());
				if (stor!=null) {
					stor.setStorenum(str.getQuantity()+stor.getStorenum());
					this.storeBillService.updateByPrimaryKeySelective(stor);
					this.importBillService.deleteByPrimaryKey(str.getImortbillid());
				}else {
					storebill stor2=new storebill();
					stor2.setMerchid(str.getMerchid());
					stor2.setStorenum(str.getQuantity());
					this.storeBillService.insertstore(stor2);
					this.importBillService.deleteByPrimaryKey(str.getImortbillid());
				}
			}
			return "ok";
		}else
		    return "false";
		
	}
	/*查询商品信息*/
	@RequestMapping("/tostoremerchid")
	@ResponseBody
	public merchbill tomerchid(String merchid) {
		merchbill merchbill=this.merchBillService.selectByPrimaryKey(merchid);
		if (merchbill!=null) {
			return merchbill;
		}
		return null;
		
	}
}
