package com.myssm.mapper;

import java.util.List;

import com.myssm.bean.TbRole;

import tk.mybatis.mapper.common.Mapper;

public interface TbRoleMapper extends Mapper<TbRole> {
	
	public List<TbRole> getRoles();
	
	public TbRole getRole(Integer roleId);
	public Integer addRole(TbRole role);
}