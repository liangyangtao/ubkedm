package com.unbank.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unbank.mybatis.entity.EmailJob;
import com.unbank.mybatis.entity.EmailJobExample;
import com.unbank.mybatis.mapper.EmailJobMapper;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailJobService;

@Service
public class EmailJobServiceImpl implements EmailJobService {

	@Autowired
	EmailJobMapper emailJobMapper;

	@Override
	public Integer getEmailJobSize(SearchModel searchModel) {

		EmailJobExample example = new EmailJobExample();

		return emailJobMapper.countByExample(example);
	}

	@Override
	public List<EmailJob> getEmailJobList(Integer page, Integer rows, SearchModel searchModel) {
		EmailJobExample example = new EmailJobExample();
		example.setOrderByClause("id limit " + (page - 1) * rows + "," + rows);
		return emailJobMapper.selectByExample(example);
	}

	@Override
	public EmailJob getEmailJobById(Integer id) {
		return emailJobMapper.selectByPrimaryKey(id);
	}

	@Override
	public void saveEmailJob(EmailJob emailJob) {
		emailJobMapper.insertSelective(emailJob);
	}

}
