package com.cqust.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.apache.commons.lang3.StringUtils;


import com.cqust.model.Result;
import com.cqust.model.profferbill;
import com.cqust.service.ProfferBillService;

@Controller
public class ProffBillController {
	
	@Autowired
	private ProfferBillService profferBillService;
	
	/*跳转供应商信息界面*/
	@RequestMapping("/toProfferbill")
	public String toProfferBill(){
		return "proffermain";
		
	}
	/*查询供应商所有信息*/
	@RequestMapping("/toSelectAllProffer")
	@ResponseBody
	public Result<profferbill> selectAll(Integer page,Integer limit,profferbill profferid,Model mode) {
		Result<profferbill> result=new Result<>();
		List<profferbill> data=new ArrayList<profferbill>();
		/*根据id查询 if (profferid!=null && profferid.getProfferid().trim().length()!=0) {*/
		
		/*if (profferid.getProfferid()!=null&&profferid.getProfferid().length()==0) {
			profferid.setProfferid(null);
		}*/
		profferid=proNull(profferid);
		if (!checkObjAllFieldsIsNull(profferid)) {
			/*profferbill str=selectByid(profferid.getProfferid());// 根据id查询 */
			List<profferbill> str=selectProffer(profferid);
			if (str==null) {
				result.setCode(200);
				result.setMsg("暂无该数据！！！");
			}
			//data.add(str);
			
			result.setData(str);
		}else {
			 data=this.profferBillService.selectAll((page-1)*10,limit);
			result.setData(data);
		}
		long count=this.profferBillService.selectCount();
		result.setCount(count);
		return result;
	}
	/*添加新供应商
	 * @param Proff 新供应商信息
	 * @throw Proff 如果为空 则抛出异常
	 * */
	@RequestMapping("/toInsertProffer")
	@ResponseBody
	public int  insertProffer(profferbill profferbill) {
		int res=0;
		if (profferbill==null) {
			 return res;
		}
		profferbill pro=this.profferBillService.selectByPrimaryKey(profferbill.getProfferid());
		if (pro!=null) {
			return res;
		}
		 res=this.profferBillService.insertProff(profferbill);
		return res;
	}
	/*跳转供应商信息添加界面*/
	@RequestMapping("/toinsertProfferBill")
	public String  toinsertProffBill(){
		return "insertProfferBill";
	}
	/*跳转供应商信息编辑界面*/
	@RequestMapping("/toupdateProfferBill")
	public String  toupdateProfferBill(String  profferid,Model model){
		profferbill profferbill=this.profferBillService.selectByPrimaryKey(profferid);
		model.addAttribute("proff", profferbill);
		return "updateProfferBill";
	}
	/*编辑供应商信息*/
	@RequestMapping("/toEditProffer")
	@ResponseBody
	public int toEditProff(profferbill profferbill){
		if (profferbill==null) {
			throw new NullPointerException();
		}
		int res =this.profferBillService.updateByPrimaryKeySelective(profferbill);
		return res;
		
	}
	/*根据id查询信息
	 * @param id 供应商id
	 * @throw null 没有该用户
	 * */
	public  profferbill selectByid(String  profferid) {
		if (profferid==null) {
			throw new NullPointerException();
		}
		profferbill profferbill=this.profferBillService.selectByPrimaryKey(profferid);
		if (profferbill!=null) {
			return profferbill;
		}
		return null;
	}
	/*根据自定义查询信息
	 * @param proff 供应商信息
	 * @throw null 没有该用户
	 * */
	public  List<profferbill> selectProffer(profferbill  profferbill) {
		if (profferbill==null) {
			throw new NullPointerException();
		}
		List<profferbill> profferbill1=this.profferBillService.selectCondition(profferbill);
		if (profferbill1!=null) {
			return profferbill1;
		}
		return null;
	}
	/*根据id删除信息
	 * @param id 供应商id
	 * @throw null 没有该用户
	 * */
	@RequestMapping("/toDelProffer")
	@ResponseBody
	public  int delByid(String  profferid) {
		if (profferid==null) {
			return 0;
		}
		int res=this.profferBillService.deleteByPrimaryKey(profferid);
		return res;
	}
	 /**
     * 判断对象中属性值是否全为空
     *
     * @param object
     * @return
     */
    public static boolean checkObjAllFieldsIsNull(Object object) {
        if (null == object) {
            return true;
        }
 
        try {
            for (Field f : object.getClass().getDeclaredFields()) {
                f.setAccessible(true);
 
                if (f.get(object) != null && StringUtils.isNotBlank(f.get(object).toString())) {
                    return false;
                }
 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return true;
    }
    /*将字段为空或者空字符的设置为null*/
    public profferbill proNull(profferbill profferid) {
    	if (profferid.getProfferid()!=null&&profferid.getProfferid().length()==0) {
			profferid.setProfferid(null);
		}
    	if (profferid.getAccountid()!=null&&profferid.getAccountid().length()==0) {
			profferid.setAccountid(null);
		}
    	if (profferid.getPhone()!=null&&profferid.getPhone().length()==0) {
			profferid.setPhone(null);
		}
    	if (profferid.getAddress()!=null&&profferid.getAddress().length()==0) {
			profferid.setAddress(null);
		}
    	if (profferid.getContactperson()!=null&&profferid.getContactperson().length()==0) {
			profferid.setContactperson(null);
		}
    	if (profferid.getFullname()!=null&&profferid.getFullname().length()==0) {
			profferid.setFullname(null);
		}
    	if (profferid.getOpeningbank()!=null&&profferid.getOpeningbank().length()==0) {
			profferid.setOpeningbank(null);
		}
		return profferid;
	}
	
}
