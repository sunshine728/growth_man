package com.myssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbRole;
import com.myssm.bean.TbUserRole;
import com.myssm.mapper.TbUserRoleMapper;

@Transactional
@Service
public class TbUserRoleService {
	@Autowired
	private TbUserRoleMapper tbUserRoleMapper;
	
	public TbRole getRole(Integer userId){
		return tbUserRoleMapper.getRole(userId);
	}
	public TbUserRole countUserId(Integer userId){
		return tbUserRoleMapper.countUserId(userId);
	};
	public int delUserRole(Integer userId){
		return tbUserRoleMapper.delUserRole(userId);
	};
	public int addUserRole(TbUserRole tbUserRole){
		return tbUserRoleMapper.addUserRole(tbUserRole);
	};
	public int delUserRole(TbUserRole tbUserRole){
		return tbUserRoleMapper.deleteByPrimaryKey(tbUserRole);
	};
/*	public TbRole getRoleInfo(Integer roleId){
		 Example example=new Example(TbUserRole.class);
		 example.or().andEqualTo("roleId", roleId);
		 System.out.println(example);
		return  tbRoleMapper.selectByExample(example).get(0);
	}*/
}
