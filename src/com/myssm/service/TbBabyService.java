package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbBaby;
import com.myssm.mapper.TbBabyMapper;
@Transactional
@Service
public class TbBabyService {
	@Autowired
	private TbBabyMapper tbBabyMapper;
	public List<TbBaby> selectByUserId(Integer userId){
		 Example example=new Example(TbBaby.class);
		 example.or().andEqualTo("userId", userId);
		 TbBaby baby=null;
		return tbBabyMapper.selectByExample(example);
	}
	
	public Integer addBabyInfo(TbBaby baby){
		return tbBabyMapper.insertSelective(baby);
	}
	
	public Integer delBabyInfo(Integer userId){
		Example example=new Example(TbBaby.class);
		 example.or().andEqualTo("userId", userId);
		return tbBabyMapper.deleteByExample(userId);
	}
	
	public Integer updateBabyInfo(TbBaby baby,Integer userId){
		 Example example=new Example(TbBaby.class);
		 example.or().andEqualTo("userId", userId);
		return tbBabyMapper.updateByExampleSelective(baby, example);
	}
}
