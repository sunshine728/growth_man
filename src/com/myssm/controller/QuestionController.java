package com.myssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.myssm.bean.TbQuestion;
import com.myssm.bean.TbQuestionCategory;
import com.myssm.service.QuestionCategoryService;
import com.myssm.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	@Autowired
	private QuestionCategoryService questionCategoryService;
	//题目列表
	
	@RequestMapping("/questionList")
	public String showQuestionJsp(){
		return "question";
	}
	@RequestMapping("/show")
	public
	String showQuestionList(Model model) {
		List<TbQuestion> questions=questionService.getListQuestion();
		List<TbQuestionCategory> questionTypeName=questionCategoryService.getQuestionTypeName();
		Map<List<TbQuestion>,List<TbQuestionCategory>> all=new HashMap<List<TbQuestion>, List<TbQuestionCategory>>();
		List<TbQuestion> questionList=new ArrayList<TbQuestion>();
		List<TbQuestionCategory> questionTypeNames=new ArrayList<TbQuestionCategory>();


	for(int i=0;i<questions.size();i++){
			for(int j=0;j<questionTypeName.size();j++){
				if(questions.get(i).getQuestionType().equals(questionTypeName.get(j).getCategoryId())){
					questionList.add(i,questions.get(i));
					questionTypeNames.add(i,questionTypeName.get(j));
			}
			}
		}
//	all.put(questionList, questionTypeNames);
//	model.addAttribute("questions", JSON.toJSONString(all));
		
	  model.addAttribute("questions", JSON.toJSONString(questionList));
//		model.addAttribute("questionTypeName", JSON.toJSONString(questionTypeNames));
		return "question";
	}
	
}
