package com.myssm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myssm.bean.TbRole;
import com.myssm.bean.TbUser;
import com.myssm.bean.TbUserMenu;
import com.myssm.bean.TbUserRole;
import com.myssm.service.TbMenuService;
import com.myssm.service.TbRoleService;
import com.myssm.service.TbUserMenuService;
import com.myssm.service.TbUserRoleService;
import com.myssm.service.TbUserService;
@Controller
@RequestMapping("/user_role")
public class UserRoleController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private TbUserService tbUserService;
	@Autowired
	private TbRoleService tbRoleService;
	@Autowired
	private TbUserRoleService tbUserRoleService;
	@Autowired
	private TbMenuService tbMenuService;
	@Autowired
	private TbUserMenuService tbUserMenuService;
	
	
	@RequestMapping("/detail")
	public String showUserRoleJsp(Integer userId,Model model){
		model.addAttribute("user",tbUserService.getUser(userId));
		TbUserRole role=tbUserRoleService.countUserId(userId);
		if(role!=null){
			model.addAttribute("u_r",role.getRoleId());
		}
		model.addAttribute("roles", tbRoleService.getRole());
		return "user_role_detail";
	}
	
	@RequestMapping("/role_detail")
	public String updateUserRole(Integer userId,Integer roleId,String op){
		if("upd".equals(op)){
	//���û������ɫ 1ͨ��ǰuserId��ѯ��tb_user_role�����Ƿ��ж�Ӧ����� ����ɾ��
		TbUserRole tbUserRole=tbUserRoleService.countUserId(userId);
		if(!(null==tbUserRole||"".equals(tbUserRole))){
			tbUserRoleService.delUserRole(userId);
		}
	//��ӵ�ǰ�������tb_user_role��
		TbUserRole tbUserRole_ =new TbUserRole();
		tbUserRole_.setUserId(userId);
		tbUserRole_.setRoleId(roleId);
		tbUserRoleService.addUserRole(tbUserRole_);
		
		}
		if("del".equals(op)){
			tbUserRoleService.delUserRole(userId);
			tbUserService.delUser(userId);
		}
		return "user_role_detail";
	}
	
	@RequestMapping("/role_menu_detail")
	public String showRoleJsp(Integer roleId,Model model){
		model.addAttribute("role",tbRoleService.getRole(roleId));
		model.addAttribute("menu", tbMenuService.getMenu());
		model.addAttribute("res",tbUserMenuService.selByRoleId(roleId));
		return "role_detail";
	}
	
	@RequestMapping("/add")
	public String addRoleJsp(Model model){
		model.addAttribute("menu", tbMenuService.getMenu());
		return "add_role_detail";
	}

/*	public String updateRole(Integer roleId ){
	
	//���û������ɫ 1ͨ��ǰuserId��ѯ��tb_user_role�����Ƿ��ж�Ӧ����� ����ɾ��
		TbUserRole tbUserRole=tbUserRoleService.countUserId(userId);
		if(!(null==tbUserRole||"".equals(tbUserRole))){
			tbUserRoleService.delUserRole(userId);
		}
	//��ӵ�ǰ�������tb_user_role��
		TbUserRole tbUserRole_ =new TbUserRole();
		tbUserRole_.setUserId(userId);
		tbUserRole_.setRoleId(roleId);
		tbUserRoleService.addUserRole(tbUserRole_);
		return "role_detail";
	}*/
	@RequestMapping("/update_role_detail")
	 protected String updateRoleDetail(HttpServletRequest req, HttpServletResponse resp,HttpSession session)
	            throws ServletException, IOException{
		List<TbUserMenu> tbUserMenu=new ArrayList<TbUserMenu>();
		try {
			tbUserMenuService.delByRoleId(Integer.valueOf(req.getParameter("roleId")));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String[] a= req.getParameterValues("menuId");
		for(int i=0;i<a.length;i++){
			TbUserMenu roles=new TbUserMenu();
			roles.setResId(req.getParameter("roleId"));
			roles.setMenuId(a[i]);
			TbUser tbUser=(TbUser)session.getAttribute("USERONLINE");
			roles.setCreater(tbUser.getUserName());
			roles.setCreateDate(new SimpleDateFormat("yyyyMMdd").format(new Date()));
			tbUserMenu.add(roles);
		}
		try {
			tbUserMenuService.addResAuthBatch(tbUserMenu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "role_detail";
		}
		return "role_detail";
		
	 }
	@RequestMapping("/add_role_detail")
	 protected String addRoleDetail(HttpServletRequest req, HttpServletResponse resp,HttpSession session)
	            throws ServletException, IOException{
		List<TbUserMenu> tbUserMenu=new ArrayList<TbUserMenu>();
		TbRole role=new TbRole();
		role.setRoleName(req.getParameter("roleName"));
		Integer f=tbRoleService.addRole(role);
		String[] a= req.getParameterValues("menuId");
		for(int i=0;i<a.length;i++){
			TbUserMenu roles=new TbUserMenu();
			roles.setResId(String.valueOf(role.getRoleId()));
			roles.setMenuId(a[i]);
			TbUser tbUser=(TbUser)session.getAttribute("USERONLINE");
			roles.setCreater(tbUser.getUserName());
			roles.setCreateDate(new SimpleDateFormat("yyyyMMdd").format(new Date()));
			tbUserMenu.add(roles);
		}
		try {
			tbUserMenuService.addResAuthBatch(tbUserMenu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "role_detail";
		}
		return "role_detail";
	 }
	
	@RequestMapping("/delete")
	public String delRoleDetail(Integer roleId){
		try {
			tbRoleService.delRole(roleId);
			tbUserMenuService.delByRoleId(roleId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return "role_detail";
		}
		return "role_detail";
	}
}
