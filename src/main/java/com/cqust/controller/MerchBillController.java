package com.cqust.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqust.model.Result;
import com.cqust.model.merchbill;
import com.cqust.model.profferbill;
import com.cqust.service.MerchBillService;
import com.cqust.service.ProfferBillService;

@Controller
public class MerchBillController {

	@Autowired
	private MerchBillService merchBillService;
	@Autowired
	private ProfferBillService profferBillService;
	
	/*跳转商品信息界面*/
	@RequestMapping("/toMerchbill")
	public String toMerchBill(){
		return "merchMain";
		
	}
	/*查询商品所有信息*/
	@RequestMapping("/toSelectAllMerch")
	@ResponseBody
	public Result<merchbill> selectAll(Integer page,Integer limit,String merchid,String kind,Model mode) {
		Result<merchbill> result=new Result<>();
		List<merchbill> data=new ArrayList<merchbill>();
		/*根据类别查询*/
		if (kind!=null&& kind.trim().length()!=0 && !kind.equals("null")) {
			List<merchbill> str=this.merchBillService.selectBykind(kind);
			List<merchbill> str2=new ArrayList<>();
			/*根据当前类别查找id*/
			if (merchid!=null && merchid.trim().length()!=0&&str!=null) {
				for (merchbill merchbill : str) {
					if (merchbill.getMerchid().equals(merchid)) {
						str2.add(merchbill);
					}
				}
				result.setData(str2);
			}else {
				if (str==null) {
					result.setCode(200);
					result.setMsg("暂无该数据！！！");
				}
				result.setData(str);
			}
			
			
		}else {
			/*根据id查询*/
			if (merchid!=null && merchid.trim().length()!=0) {
				merchbill str=selectByid(merchid);
				if (str==null) {
					result.setCode(200);
					result.setMsg("暂无该数据！！！");
				}
				data.add(str);
				result.setData(data);
			}else {
				 data=this.merchBillService.selectAll((page-1)*10,limit);
				result.setData(data);
			}
		}
		
		long count=this.merchBillService.selectCount();
		result.setCount(count);
		return result;
	}
	/*添加新商品
	 * @param merch 新商品信息
	 * @throw merch 如果为空 则抛出异常
	 * */
	@RequestMapping("/toinsertMerch")
	@ResponseBody
	public int  insertMerch(merchbill merchbill) {
		int res=0;
		if (merchbill==null) {
			 return res;
		}
		merchbill pro=this.merchBillService.selectByPrimaryKey(merchbill.getMerchid());
		if (pro!=null) {
			return res;
		}
		 res=this.merchBillService.insertMerch(merchbill);
		return res;
	}
	/*查询已有的供应商号*/
	public List<String> profid() {
		List<profferbill> list=this.profferBillService.selectAll(null, null);
		List<String> list2=new ArrayList<>();
		for (profferbill str : list) {
			list2.add(str.getProfferid());
		}
		return list2;
		
	}
	/*跳转商品信息添加界面*/
	@RequestMapping("/toinsertMerchBill")
	public String  toinsertMerchBill(Model model){
		List<String> list2=profid();
		model.addAttribute("proffer", list2);
		return "insertMerchBill";
	}
	/*跳转商品信息编辑界面*/
	@RequestMapping("/toupdateMerchBill")
	public String  toupdateMerchBill(String  merchid,Model model){
		merchbill merchbill=this.merchBillService.selectByPrimaryKey(merchid);
		List<String> list=profid();
		model.addAttribute("merch", merchbill);
		model.addAttribute("profferid", list);
		return "updateMerchBill";
	}
	/*编辑商品信息*/
	@RequestMapping("/toEditMerch")
	@ResponseBody
	public int toEditMerch(merchbill merchbill){
		if (merchbill==null) {
			throw new NullPointerException();
		}
		int res =this.merchBillService.updateByPrimaryKeySelective(merchbill);
		return res;
		
	}
	/*根据id查询信息
	 * @param id 商品id
	 * @throw null 没有该商品
	 * */
	public  merchbill selectByid(String  merchid) {
		if (merchid==null) {
			throw new NullPointerException();
		}
		merchbill merchbill=this.merchBillService.selectByPrimaryKey(merchid);
		if (merchbill!=null) {
			return merchbill;
		}
		return null;
	}
	/*根据id删除信息
	 * @param id 商品id
	 * @throw null 没有该商品
	 * */
	@RequestMapping("/toDelMerch")
	@ResponseBody
	public  int delByid(String  merchid) {
		if (merchid==null) {
			return 0;
		}
		int res=this.merchBillService.deleteByPrimaryKey(merchid);
		return res;
	}
}
