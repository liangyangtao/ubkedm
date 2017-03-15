package com.unbank.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Service;

import com.unbank.mybatis.entity.EmailSender;
import com.unbank.mybatis.entity.EmailSenderExample;
import com.unbank.mybatis.mapper.EmailSenderMapper;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailSenderService;

@Service
//@EnableCaching
public class EmailSenderServiceImpl implements EmailSenderService {

	@Autowired
	EmailSenderMapper emailSenderMapper;

//	@Cacheable(value = "senderCount",key="#searchModel.getRank()")
	public int getEmailSenderSize(SearchModel searchModel) {
		EmailSenderExample example = new EmailSenderExample();
		Integer rank = searchModel.getRank();
		example.or().andRankEqualTo(rank);
		return emailSenderMapper.countByExample(example);
	}

	public List<EmailSender> getEmailSenderList(int page, int rows, SearchModel searchModel) {

		EmailSenderExample example = new EmailSenderExample();
		Integer rank = searchModel.getRank();
		example.or().andRankEqualTo(rank);
		example.setOrderByClause("id limit " + (page - 1) * rows + "," + rows);
		return emailSenderMapper.selectByExample(example);
	}

	@Override
	public EmailSender getEmailSenderByid(Integer id) {
		return emailSenderMapper.selectByPrimaryKey(id);
	}

}
