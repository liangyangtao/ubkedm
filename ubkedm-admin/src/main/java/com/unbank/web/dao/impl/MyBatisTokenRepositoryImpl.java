package com.unbank.web.dao.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.unbank.mybatis.entity.PersistentLogin;
import com.unbank.mybatis.entity.PersistentLoginExample;
import com.unbank.mybatis.mapper.PersistentLoginMapper;

@Repository("tokenRepositoryDao")
@Transactional
public class MyBatisTokenRepositoryImpl implements PersistentTokenRepository {

	static final Logger logger = LoggerFactory.getLogger(MyBatisTokenRepositoryImpl.class);
	
	@Autowired
	PersistentLoginMapper persistentLoginMapper;

	public void createNewToken(PersistentRememberMeToken token) {
		logger.info("Creating Token for user : {}", token.getUsername());
		PersistentLogin persistentLogin = new PersistentLogin();
		persistentLogin.setUsername(token.getUsername());
		persistentLogin.setSeries(token.getSeries());
		persistentLogin.setToken(token.getTokenValue());
		persistentLogin.setLastUsed(token.getDate());
		persistentLoginMapper.insertSelective(persistentLogin);
	}

	public PersistentRememberMeToken getTokenForSeries(String seriesId) {
		logger.info("Fetch Token if any for seriesId : {}", seriesId);
		try {
			PersistentLoginExample example = new PersistentLoginExample();
			example.or().andSeriesEqualTo(seriesId);
			List<PersistentLogin> persistentLogins = persistentLoginMapper.selectByExample(example);
			if (persistentLogins.size() > 0) {
				PersistentLogin persistentLogin = persistentLogins.get(0);
				return new PersistentRememberMeToken(persistentLogin.getUsername(), persistentLogin.getSeries(),
						persistentLogin.getToken(), persistentLogin.getLastUsed());
			}
		} catch (Exception e) {
			logger.info("Token not found...");
		}
		return null;
	}

	public void removeUserTokens(String username) {
		PersistentLoginExample example = new PersistentLoginExample();
		example.or().andUsernameEqualTo(username);
		persistentLoginMapper.deleteByExample(example);

	}

	public void updateToken(String seriesId, String tokenValue, Date lastUsed) {
		logger.info("Updating Token for seriesId : {}", seriesId);
		PersistentLogin persistentLogin = getByKey(seriesId);
		if (persistentLogin != null) {
			persistentLogin.setToken(tokenValue);
			persistentLogin.setLastUsed(lastUsed);
			PersistentLoginExample example = new PersistentLoginExample();
			example.or().andUsernameEqualTo(seriesId);
			persistentLoginMapper.updateByExampleSelective(persistentLogin, example);
		}

	}

	public PersistentLogin getByKey(String seriesId) {
		PersistentLoginExample example = new PersistentLoginExample();
		example.or().andSeriesEqualTo(seriesId);
		List<PersistentLogin> persistentLogins = persistentLoginMapper.selectByExample(example);
		if (persistentLogins.size() > 0) {
			return persistentLogins.get(0);
		} else {
			return null;
		}
	}

}
