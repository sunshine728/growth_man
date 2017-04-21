package com.myssm.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.myssm.bean.TbMenu;
import com.myssm.bean.TbRole;
import com.myssm.bean.TbUser;
import com.myssm.bean.TbUserMenu;
import com.myssm.bean.TbUserRole;
import com.myssm.service.TbMenuService;
import com.myssm.service.TbUserMenuService;
import com.myssm.service.TbUserRoleService;
import com.myssm.service.TbUserService;
@Controller
@RequestMapping("/login")
public class LoginController {

//	@Autowired
//	private LoginService loginService;
	@Autowired
	private TbUserService tbUserService;
	@Autowired
	private TbMenuService tbMenuService;
	@Autowired
	private TbUserRoleService tbUserRoleService;
	
	@Autowired
	private TbUserMenuService tbUserMenuService;
/*	@RequestMapping("/form")
	public String loginForm() {
		return "/login";
	}

	@RequestMapping("/confirm")
	public @ResponseBody
	Employee confirm(String username, String password) {
		return loginService.getEmployee(username, password);
	}

	@RequestMapping("/mng_stu")
	public String toMngStu() {
		return "/mng_stu";
	}*/
	//主页面的登录跳转调用
	@RequestMapping("/dl")
	public String login() {
		return "login";
	}
	
	//主页面的注册页面跳转调用
	@RequestMapping("/zc")
	public String register(Model model) {
		List<TbUser> users=tbUserService.getUsers();
		model.addAttribute("users",users);
		return "region";
	}
	
	@RequestMapping("/reg")
	@ResponseBody
	public String reg(String userName,String pwd,Model model) {
		TbUser user=new TbUser();
		user.setUserName(userName);
		user.setUserPwd(pwd);
		Integer id=-1;
		try{
			id=tbUserService.addUser(user);
		}catch(Exception e){
			
		}
		if(id==-1){
			return "reg";
		}
		
		TbUserRole tbUserRole=new TbUserRole();
		tbUserRole.setUserId(user.getUserId());
		tbUserRole.setRoleId(1);
		tbUserRoleService.addUserRole(tbUserRole);
		
		String str=userName+","+pwd;
		
		return JSON.toJSONString(str);
	}
	
	//校验输入的信息是否能登录进新页面~
	@RequestMapping("/loginnow")
	public @ResponseBody String checkLogin(TbUser tbUser,HttpSession session){
		List<TbUser> checkUser = tbUserService.getUserNames();
		for(int i=0;i<checkUser.size();i++){
			if(checkUser.get(i).getUserName().equals(tbUser.getUserName())){
				if(checkUser.get(i).getUserPwd().equals(tbUser.getUserPwd())){
				session.setAttribute("USERONLINE",checkUser.get(i));
				TbRole role=tbUserService.getRole(checkUser.get(i).getUserId());
				if(role!=null){
					session.setAttribute("USER_ROLE", role);
					List<TbUserMenu> roleMenu =tbUserMenuService.selByRoleId(role.getRoleId());
					if(roleMenu.size()==0||null==roleMenu){
						session.setAttribute("NULLMENU","还未未被分配菜单权限");
						return "nullMenus";
					}else{
						List<String> menuId=new ArrayList<String>();
						for(int j=0;j<roleMenu.size();j++){
							menuId.add(j, roleMenu.get(j).getMenuId());
						}
						List<TbMenu> menuInfo=tbMenuService.selByMenuId(menuId);
						if(menuInfo.size()==0||null==menuInfo){
							session.setAttribute("USER_MENU", null);	

							return "nullMenus";
						}else{
							session.setAttribute("USER_MENU", menuInfo);	
							return "yes";
						}
					}
				}				
				}else{
					return "erroPassword";
				}
			}
		}	
			return "nullUser";	
	}
	
	
	@RequestMapping("/loginout")
	public String loginOut(HttpSession session){
		session.removeAttribute("USERONLINE");
		session.removeAttribute("USER_ROLE");
		session.removeAttribute("USER_MENU");

		return "index";
	}
	
	//跳转至主页面
	@RequestMapping("/loginIn")
	public String loginIndex() {
		return "index";
	}

}
