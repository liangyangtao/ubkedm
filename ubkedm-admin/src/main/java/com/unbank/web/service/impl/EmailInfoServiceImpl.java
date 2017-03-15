package com.unbank.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unbank.mybatis.entity.EmailInfo;
import com.unbank.mybatis.entity.EmailInfoExample;
import com.unbank.mybatis.mapper.EmailInfoMapper;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailInfoService;

@Service
public class EmailInfoServiceImpl implements EmailInfoService {

	@Autowired
	EmailInfoMapper emailInfoMapper;

	@Override
	public Integer getEmailInfoSize(SearchModel searchModel) {
		EmailInfoExample example = new EmailInfoExample();
		return emailInfoMapper.countByExample(example);
	}

	@Override
	public List<EmailInfo> getEmailInfoList(Integer page, Integer rows, SearchModel searchModel) {
		EmailInfoExample example = new EmailInfoExample();
		example.setOrderByClause("id limit " + (page - 1) * rows + "," + rows);
		return emailInfoMapper.selectByExampleWithBLOBs(example);
	}

	@Override
	public EmailInfo getEmailInfoById(Integer id) {
		return emailInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public void saveEmailInfo(EmailInfo emailInfo) {
		emailInfoMapper.insertSelective(emailInfo);
	}

}
