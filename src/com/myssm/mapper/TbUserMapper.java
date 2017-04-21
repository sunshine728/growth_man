package com.myssm.mapper;

import java.util.List;

import com.myssm.bean.TbUser;

import tk.mybatis.mapper.common.Mapper;

public interface TbUserMapper extends Mapper<TbUser> {
	
	public TbUser getUser(Integer userId);
	
	public List<TbUser> getUsers();
	
	public Integer delUser(Integer userId);
	
	public Integer addUser(TbUser user);
	
}