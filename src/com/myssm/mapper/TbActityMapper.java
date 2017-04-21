package com.myssm.mapper;

import java.util.List;

import com.myssm.bean.TbActity;

import tk.mybatis.mapper.common.Mapper;

public interface TbActityMapper extends Mapper<TbActity> {
	public List<TbActity> getActivities(Integer actId);
	public TbActity getAct(Integer actId);
	public Integer insAct(TbActity act);
	public Integer updAct(TbActity act);
	public Integer delAct(TbActity act);
}