package com.unbank.web.service;

import java.util.List;

import com.unbank.mybatis.entity.EmailReiver;
import com.unbank.web.model.SearchModel;

public interface EmailReiverService {

	Integer getEmailReiverSize(SearchModel searchModel);

	List<EmailReiver> getEmailReiverList(Integer page, Integer rows, SearchModel searchModel);
	
	EmailReiver getEmailReiverByid(Integer id);
	

}
