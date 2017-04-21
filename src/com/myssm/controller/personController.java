package com.myssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.myssm.bean.TbBaby;
import com.myssm.bean.TbRole;
import com.myssm.bean.TbUser;
import com.myssm.service.TbBabyService;
import com.myssm.service.TbUserService;


@Controller
@RequestMapping("/person")
public class personController {
	@Autowired
	private TbUserService tbUserService;
	@Autowired
	private TbBabyService tbBabyService;
/*	@RequestMapping("/person_detail")
	public String getUser(Integer userId,Model model){
		TbUser user=tbUserService.getUser(userId);
		model.addAttribute("user", user);
		return "personal_data";
	}*/
	
	@RequestMapping("/users")
	public String getUsers(Model model){
		List<TbUser> users=tbUserService.getUsers();
		model.addAttribute("users", JSON.toJSONString(users));
		return "user_roleManger";
	}
	
	@RequestMapping("/roles")
	public String getRoles(Model model){
		List<TbRole> roles=tbUserService.getRoles();
		model.addAttribute("roles", JSON.toJSONString(roles));
		return "roles";
	}
	
	
	@RequestMapping("/person_detail")
	public String person_detail(HttpSession session,Model model){
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			return "redirect:/home/index";
		}else{
		model.addAttribute("user", user);
		 List<TbBaby> list=tbBabyService.selectByUserId(user.getUserId());
		 if(list.size()!=0){
				model.addAttribute("baby", tbBabyService.selectByUserId(user.getUserId()).get(0));
 
		 }
		 else{
			 model.addAttribute("baby", null);
		 }
		return "personal_data";
	}
	}	
	
	@RequestMapping("/update_person_info")
	public @ResponseBody String person_update_info( TbBaby tbBaby,Model model,HttpSession session){
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			return "redirect:/home/index";
		}else{
			List<TbBaby> baby=tbBabyService.selectByUserId(user.getUserId());
			Integer flag=0;
			if(baby.size()!=0){
				flag=tbBabyService.updateBabyInfo(tbBaby, user.getUserId());
			}
			else{
				 flag=tbBabyService.addBabyInfo(tbBaby);	
			}
			
			if(flag==1){
				session.setAttribute("USERONLINE", tbUserService.getUser(user.getUserId()));

				return "yes";
			}else{
			return 	"no";
			}	
		}
		
	
	}	
	
	@RequestMapping("/person_pwd")
	public String person_pwd(HttpSession session,Model model){
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			return "redirect:/home/index";
		}else{
		model.addAttribute("user", user);
		return "person_detail";
	}
	}	
	
	@RequestMapping("/person_update_pwd")
	public @ResponseBody String person_update_pwd( TbUser tbUser,Model model,HttpSession session){
		
		Integer flag=tbUserService.updatePwd(tbUser);
		if(flag==1){
			session.setAttribute("USERONLINE", tbUserService.getUser(tbUser.getUserId()));
			return "yes";
		}else{
		return 	"no";
		}
		
	
	}
}
