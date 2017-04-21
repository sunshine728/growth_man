package com.myssm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.*;
import com.myssm.bean.TbActity;
import com.myssm.bean.TbUser;
import com.myssm.service.ActivityService;

@Controller
@RequestMapping("/sch")
public class SchController {
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping("/schManger")
	public String getSch(Model model,HttpSession session){
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			return "index";
		}
		List<TbActity> actities=activityService.getActities(user.getUserId());
		model.addAttribute("acts",JSON.toJSONString(actities));
		return "sch";
	}
	@RequestMapping("/schOp")
	public String del(@RequestBody Map<String, Object> map,Model model,HttpSession session) throws ParseException{
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			return "index";
		}
		TbActity actity=new TbActity();
		if(map.containsKey("actId")){
			String str=map.get("actId").toString();
			if(str!=null&&!str.equals("")){
				actity.setActityId(Integer.parseInt(map.get("actId").toString()));
			}
		}
		if(map.containsKey("title")){
			actity.setActityTitle(map.get("title").toString());
		}else{
			actity.setActityTitle("нч");
		}
		if(map.containsKey("content")){
			actity.setActityContent(map.get("content").toString());
		}else{
			actity.setActityTitle("нч");
		}
		if(map.containsKey("start")){
			System.out.println(map.get("start").toString());
			System.out.println(new SimpleDateFormat("yyyy-MM-dd").parse(map.get("start").toString()));
			actity.setActityStartdate(new SimpleDateFormat("yyyy-MM-dd").parse(map.get("start").toString()));
		}else{
			actity.setActityStartdate(new Date());
		}
		if(map.containsKey("end")){
			actity.setActityEnddate(new SimpleDateFormat("yyyy-MM-dd").parse(map.get("end").toString()));
		}else{
			actity.setActityEnddate(new Date());
		}
		actity.setCreateUserId(user.getUserId());
			
			
			
		if(map.get("op").equals("del")){
			if(actity.getActityId()!=null){
				activityService.delAct(actity);
			}
		}
		if(map.get("op").equals("add")){
			activityService.insAct(actity);
			
			System.out.println("add");
		}
		if(map.get("op").equals("change")){
			if(actity.getActityId()!=null){
				activityService.updAct(actity);
			}
			
		}
		return "sch";
	}
	
	@RequestMapping("/schDetail")
	public String schDetail(Model model,String act,HttpSession session){
		Integer btn=1;
		TbUser user=null;
		try{
			user=(TbUser)session.getAttribute("USERONLINE");
		}catch(Exception e){
			
		}
		if(user==null){
			return "index";
		}
		
		if(act.indexOf('-')>0){
			btn=2;
			model.addAttribute("startDate",act);
			
		}else{
			TbActity acts=activityService.getAct(Integer.parseInt(act));
		
			System.out.println(acts.getActityEnddate());
			model.addAttribute("acts",acts);
			model.addAttribute("start",new SimpleDateFormat("yyyy-MM-dd").format(acts.getActityStartdate()));
			model.addAttribute("end",new SimpleDateFormat("yyyy-MM-dd").format(acts.getActityEnddate()));

			
		}
		model.addAttribute("btn",btn);
		return "schDetail";
	}
	
}
