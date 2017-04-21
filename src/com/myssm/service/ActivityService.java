package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myssm.bean.TbActity;
import com.myssm.mapper.TbActityMapper;

@Service
public class ActivityService {
	@Autowired
	private TbActityMapper tbActityMapper;
	
	public List<TbActity> getActities(Integer userId){
		
		return tbActityMapper.getActivities(userId); 
	}
	public TbActity getAct(Integer actId){
		
		return tbActityMapper.getAct(actId); 
	}
	public Integer insAct(TbActity act){
		
		return tbActityMapper.insAct(act); 
	}
	public Integer updAct(TbActity act){
		
		return tbActityMapper.updAct(act); 
	}
public Integer delAct(TbActity act){
		
		return tbActityMapper.delAct(act); 
	}
}
