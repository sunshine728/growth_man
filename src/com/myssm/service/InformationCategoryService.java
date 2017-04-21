package com.myssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myssm.mapper.TbInformationCategoryMapper;
@Transactional
@Service
public class InformationCategoryService {

	@Autowired
	private TbInformationCategoryMapper tbInformationCategoryMapper;

	public String getCategoryName(Integer CategoryId){
		return tbInformationCategoryMapper.getInformationCategoryName(CategoryId);
	}
}
