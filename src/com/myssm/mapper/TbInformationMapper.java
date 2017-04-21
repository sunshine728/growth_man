package com.myssm.mapper;

import java.util.List;

import com.myssm.bean.TbInformation;

import tk.mybatis.mapper.common.Mapper;

public interface TbInformationMapper extends Mapper<TbInformation> {
	
	public List<TbInformation> getInformation(Integer infoCategoryId);
	
	public TbInformation getInfo(Integer infoId);
}