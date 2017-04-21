package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myssm.bean.TbInformation;
import com.myssm.mapper.TbInformationMapper;

@Transactional
@Service
public class InformationService {
	
	@Autowired
	private TbInformationMapper tbInformationMapper;
	
	public List<TbInformation> getInformations(Integer infoCategoryId){
		return tbInformationMapper.getInformation(infoCategoryId);
	}
	
	public TbInformation getInfo(Integer infoId){
		return tbInformationMapper.getInfo(infoId);
	}
}
