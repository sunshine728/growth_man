package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbRole;
import com.myssm.mapper.TbRoleMapper;
@Transactional
@Service
public class TbRoleService {
	@Autowired
	private TbRoleMapper tbRoleMapper;
	
	public List<TbRole> getRole(){
		return tbRoleMapper.selectAll();
	}
	public TbRole getRole(Integer roleId){
		return tbRoleMapper.selectByPrimaryKey(roleId);
	}
	public Integer addRole(TbRole role){
		return tbRoleMapper.addRole(role);
	}
	public Integer delRole(Integer roleId){
		return tbRoleMapper.deleteByPrimaryKey(roleId);
	}
}
