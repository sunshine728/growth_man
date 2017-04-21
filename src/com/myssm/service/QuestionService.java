package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

import com.myssm.bean.TbQuestion;
import com.myssm.mapper.TbQuestionMapper;

@Transactional
@Service
public class QuestionService {
@Autowired
	private TbQuestionMapper questionMapper;
	
public List<TbQuestion> getListQuestion(){
/*	Example example =new Example(TbQuestion.class);
	example.or().*/
	return questionMapper.selectAll();
}
}
