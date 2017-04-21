package com.myssm.mapper;

import com.myssm.bean.TbInformationCategory;

import tk.mybatis.mapper.common.Mapper;

public interface TbInformationCategoryMapper extends Mapper<TbInformationCategory> {
	public String getInformationCategoryName(Integer CategoryId);

}