package com.myssm.service;

import java.util.List;

import javax.swing.ListModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbFile;

import com.myssm.mapper.TbFileMapper;

@Service
public class TbFileService {
	@Autowired
	private TbFileMapper tbFileMapper;
	
	public int addResource_re(TbFile  file){
		return tbFileMapper.insertSelective(file);
	}
	
	public int delResource_re(TbFile file){
		return tbFileMapper.deleteByPrimaryKey(file);
	}
	
	public List<TbFile> selByUserId(Integer userId){
		Example example=new Example(TbFile.class);
		example.or().andEqualTo("userId",userId);
		
		return tbFileMapper.selectByExample(example);
	}
	
	public List<TbFile> selByreIds(List<Integer> a){
		Example example=new Example(TbFile.class);
		example.or().andIn("fileId",a);
		
		return tbFileMapper.selectByExample(example);
	}
	public Integer delByResourceId(List<Integer> a){
		Example example=new Example(TbFile.class);
		example.or().andIn("fileId", a);
		
		return tbFileMapper.deleteByExample(example);
	}
	
	
	
}
