package com.unbank.web.model;

import java.io.Serializable;

/***
 * 
 * @ClassName: MailJobRule
 * @Description: 邮件发送规则实体类
 * @author: liangyangtao
 * @date: 2017年3月13日 上午10:46:37
 */
public class MailJobRule implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2835053089288529327L;

	private String jobName;
	private String mailId;
	private String mailNum;
	private String startJobTime;
	private String endJobTime;
	private String timeNum;
	private String timeType;

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getMailNum() {
		return mailNum;
	}

	public void setMailNum(String mailNum) {
		this.mailNum = mailNum;
	}

	public String getStartJobTime() {
		return startJobTime;
	}

	public void setStartJobTime(String startJobTime) {
		this.startJobTime = startJobTime;
	}

	public String getEndJobTime() {
		return endJobTime;
	}

	public void setEndJobTime(String endJobTime) {
		this.endJobTime = endJobTime;
	}

	public String getTimeNum() {
		return timeNum;
	}

	public void setTimeNum(String timeNum) {
		this.timeNum = timeNum;
	}

	public String getTimeType() {
		return timeType;
	}

	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}

}
