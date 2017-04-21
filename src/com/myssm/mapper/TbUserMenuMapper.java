package com.myssm.mapper;

import java.util.List;

import com.myssm.bean.TbUserMenu;

import tk.mybatis.mapper.common.Mapper;

public interface TbUserMenuMapper extends Mapper<TbUserMenu> {
	  public int addResAuthBatch(List<TbUserMenu> trainRecordList);
}