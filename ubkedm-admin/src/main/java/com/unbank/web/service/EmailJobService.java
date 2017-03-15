package com.unbank.web.service;

import java.util.List;

import com.unbank.mybatis.entity.EmailJob;
import com.unbank.web.model.SearchModel;

public interface EmailJobService {

	Integer getEmailJobSize(SearchModel searchModel);

	List<EmailJob> getEmailJobList(Integer page, Integer rows, SearchModel searchModel);

	EmailJob getEmailJobById(Integer id);
	
	void saveEmailJob(EmailJob emailJob);
}
