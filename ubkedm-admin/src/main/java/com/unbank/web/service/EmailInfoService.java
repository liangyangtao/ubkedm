package com.unbank.web.service;

import java.util.List;

import com.unbank.mybatis.entity.EmailInfo;
import com.unbank.web.model.SearchModel;

public interface EmailInfoService {

	Integer getEmailInfoSize(SearchModel searchModel);

	List<EmailInfo> getEmailInfoList(Integer page, Integer rows, SearchModel searchModel);

	EmailInfo getEmailInfoById(Integer id);

	void saveEmailInfo(EmailInfo emailInfo);
	
	
}
