package com.myssm.mapper;

import com.myssm.bean.TbRole;
import com.myssm.bean.TbUserRole;

import tk.mybatis.mapper.common.Mapper;

public interface TbUserRoleMapper extends Mapper<TbUserRole> {
	
	public TbRole getRole(Integer userId);
	public TbUserRole countUserId(Integer userId);
	public int delUserRole(Integer userId);
	public int addUserRole(TbUserRole tbUserRole);
}