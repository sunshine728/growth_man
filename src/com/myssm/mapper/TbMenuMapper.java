package com.myssm.mapper;

import java.util.List;

import com.myssm.bean.TbMenu;

import tk.mybatis.mapper.common.Mapper;

public interface TbMenuMapper extends Mapper<TbMenu> {
	public List<TbMenu> getMenu();
}