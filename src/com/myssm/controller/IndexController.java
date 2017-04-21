package com.myssm.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myssm.bean.TbActity;
import com.myssm.bean.TbBaby;
import com.myssm.bean.TbInformation;
import com.myssm.bean.TbUser;
import com.myssm.service.ActivityService;
import com.myssm.service.InformationCategoryService;
import com.myssm.service.InformationService;
import com.myssm.service.TbBabyService;

@Controller
@RequestMapping("/home")
public class IndexController {
	@Autowired
	private InformationService informationService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private InformationCategoryService informationCategoryService;
	@Autowired
	private TbBabyService tbBabyService;
	@RequestMapping("/index")
	public String index(Model model){
		model.addAttribute("power",1);
		return "index";
	}
	
	@RequestMapping("/infos")
	public String style_demo(Integer infoCategoryId,Model model){
		List<TbInformation>  infos=informationService.getInformations(infoCategoryId);
		
		if(!(infos.size()==0||null==infos)){
			model.addAttribute("infoCategoryId", informationCategoryService.getCategoryName(infoCategoryId));	
			model.addAttribute("infos", infos);

		}
		else
			model.addAttribute("infoCategoryId", informationCategoryService.getCategoryName(infoCategoryId));	
		return "infos";
	}
	@RequestMapping("/info_detail")
	public String detail(Integer infoId,Model model){
		TbInformation information=informationService.getInfo(infoId);
		model.addAttribute("info", information);
		return "information_detail";
	}
	


	
	@RequestMapping("/schedule")
	public String showScheduleJsp(){
	
		return "schedule";
	}

	
	@RequestMapping("/tree")
	public  String tree(HttpSession session,Model model){
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			model.addAttribute("err", "请先登录或注册！");
			return "tree";
		}else{
			try {
				List<TbBaby> baby=tbBabyService.selectByUserId(user.getUserId());
				if(baby.size()==0){
					model.addAttribute("err", "请先完善个人资料！");
					return "tree";	
				}else{
					List<TbActity> acts=activityService.getActities(user.getUserId());
					Date date=baby.get(0).getBabyBirth();
					Long days=(new Date().getTime()-date.getTime())/1000/60/60/24;
					Calendar calendar=Calendar.getInstance();
					calendar.setTime(date);
					Integer years=Calendar.getInstance().get(Calendar.YEAR)-calendar.get(Calendar.YEAR);
					model.addAttribute("borth", new SimpleDateFormat("YYYY-MM-dd").format(baby.get(0).getBabyBirth()));
					model.addAttribute("years",years);
					model.addAttribute("days",days);
					model.addAttribute("acts", acts);
					return "tree";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "redirect:/home/index";	
			}
			
			
		}
		
		
	}
}
