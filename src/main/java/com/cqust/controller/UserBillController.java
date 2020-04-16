package com.cqust.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqust.model.userbill;
import com.cqust.service.UserBillService;
import com.wf.captcha.utils.CaptchaUtil;

@Controller
public class UserBillController {
	@Autowired
	private UserBillService userBillService;
	/*
	 * 登录
	 * 
	 * */
	@RequestMapping(value="/u_login",method=RequestMethod.POST)
	public String toLogin(String loginid,String password,String verCode,HttpServletRequest request,Model model){
		//登录用户
		userbill userbill=new userbill();
		userbill.setLoginid(loginid);userbill.setPassword(password);
		if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            model.addAttribute("yzm", "验证码错误");
            return "login";
        }else {
        	HttpSession session=request.getSession();
    		userbill login=this.userBillService.login( userbill);
    	if(login != null){		
    		// 将用户对象添加到Session
    		model.addAttribute("user", login);
    		session.setAttribute("user", login);
    		return "userMain";
    	}
    	model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
    	return "login";
		}
		
	}
	/*
	 * 退出登录
	 * 
	 * */
	@RequestMapping("/login")
	public String toLogin(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		return "login";
	}
	/*
	 * 跳转密码界面
	 * */
	@RequestMapping("/topassword")
	public String toPassword(){
		return "userPassword";
	}
	/*
	 * 修改密码
	 * */
	@RequestMapping("/updatePassword")
	@ResponseBody
	public String updatePassword(String pass,String pass2,HttpServletRequest request){
		if (pass==null||pass2==null) {
			return "false";
		}
		HttpSession session=request.getSession();
		userbill user=(userbill)session.getAttribute("user");
		if (pass.equals(user.getPassword())) {
			user.setPassword(pass2);
			this.userBillService.updatePassword(user);
			return "true";
		}else
			return "false";
	}
}
