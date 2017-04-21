package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbUserMenu;
import com.myssm.mapper.TbUserMenuMapper;

@Transactional
@Service
public class TbUserMenuService {
	@Autowired
	private TbUserMenuMapper tbUserMenuMapper;
	
	 public int addResAuthBatch(List<TbUserMenu> trainRecordList){
		 return  tbUserMenuMapper.addResAuthBatch(trainRecordList);
	 };
	 
	 public List<TbUserMenu> selByRoleId(Integer roleId){
		 Example example=new Example(TbUserMenu.class);
		 example.or().andEqualTo("resId", roleId);
		 return tbUserMenuMapper.selectByExample(example);
	 }
	 public int delByRoleId(Integer roleId){
		 Example example=new Example(TbUserMenu.class);
		 example.or().andEqualTo("resId", roleId);
		 return tbUserMenuMapper.deleteByExample(example);
	 }
}
