package com.unbank.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Service;

import com.unbank.mybatis.entity.EmailReiver;
import com.unbank.mybatis.entity.EmailReiverExample;
import com.unbank.mybatis.mapper.EmailReiverMapper;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailReiverService;

@Service
//@EnableCaching
public class EmailReiverServiceImpl implements EmailReiverService {

	@Autowired
	EmailReiverMapper emailReiverMapper;

//	@Cacheable(value = "reiverCount", key = "#searchModel.getRank()")
	public Integer getEmailReiverSize(SearchModel searchModel) {

		EmailReiverExample example = new EmailReiverExample();
		int rank = searchModel.getRank();
		example.or().andRankEqualTo((byte) rank);
		return emailReiverMapper.countByExample(example);
	}

	public List<EmailReiver> getEmailReiverList(Integer page, Integer rows, SearchModel searchModel) {
		EmailReiverExample example = new EmailReiverExample();
		int rank = searchModel.getRank();
		example.or().andRankEqualTo((byte) rank);
		example.setOrderByClause("id limit " + (page - 1) * rows + "," + rows);
		return emailReiverMapper.selectByExample(example);
	}

	@Override
	public EmailReiver getEmailReiverByid(Integer id) {
		return emailReiverMapper.selectByPrimaryKey(id);
	}

}
