package com.unbank.web.service;

import java.util.List;

import com.unbank.mybatis.entity.EmailSender;
import com.unbank.web.model.SearchModel;

public interface EmailSenderService {
	public int getEmailSenderSize(SearchModel searchModel);

	public List<EmailSender> getEmailSenderList(int page, int rows, SearchModel searchModel);
	
	
	public EmailSender getEmailSenderByid(Integer id);
}
