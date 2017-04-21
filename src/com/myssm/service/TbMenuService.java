package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbMenu;
import com.myssm.bean.TbUserMenu;
import com.myssm.mapper.TbMenuMapper;
import com.myssm.mapper.TbRoleMapper;

@Transactional
@Service
public class TbMenuService {
	@Autowired
	private TbRoleMapper tbRoleMapper;
	@Autowired
	private TbMenuMapper tbMenuMapper;
	
	public List<TbMenu> getMenu(){
		return tbMenuMapper.selectAll();
	}
	
	public List<TbMenu> selByMenuId(List<String> menuId){
		 Example example=new Example(TbUserMenu.class);
		 example.or().andIn("menuId", menuId);
		 example.setOrderByClause("morder asc");
		 
		 return tbMenuMapper.selectByExample(example);
	}
}
