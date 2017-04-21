package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbRole;
import com.myssm.bean.TbUser;
import com.myssm.mapper.TbRoleMapper;
import com.myssm.mapper.TbUserMapper;
import com.myssm.mapper.TbUserRoleMapper;

@Transactional
@Service
public class TbUserService {

	@Autowired
	private TbUserMapper tbUserMapper;

	@Autowired
	private TbUserRoleMapper tbUserRoleMapper;
	
	@Autowired
	private TbRoleMapper tbRoleMapper;
	
	public TbUser getUser(Integer userId){
		return tbUserMapper.getUser(userId);
	}
	
	public TbRole getRole(Integer userId){
		return tbUserRoleMapper.getRole(userId);
	}
	public List<TbUser> getUserNames(){
		return tbUserMapper.selectAll();
		
	}
	
	public List<TbUser> getUsers(){
		return tbUserMapper.getUsers();
	}
	
	public List<TbRole> getRoles(){
		return tbRoleMapper.getRoles();
	}
	
	public Integer updatePwd(TbUser tbUser){
		return tbUserMapper.updateByPrimaryKeySelective(tbUser);
	}
	
	public Integer updatePersonInfo(TbUser tbUser){
		return tbUserMapper.updateByPrimaryKeySelective(tbUser);
	}
	public Integer delUser(Integer userId){
		return tbUserMapper.delUser(userId);
	}
	public Integer addUser(TbUser user){
		return tbUserMapper.addUser(user);
	}
	public Integer updateUploadPath(TbUser user){
		return tbUserMapper.updateByPrimaryKey(user);
	}
}
