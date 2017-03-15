package com.unbank.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.unbank.mybatis.entity.EmailJob;
import com.unbank.util.CommonUtils;
import com.unbank.web.model.MailJobRule;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailJobService;

@Controller
@RequestMapping("/")
public class EmailJobController extends CommonController {

	@Autowired
	EmailJobService emailJobService;

	@RequestMapping(value = { "emailJoblist" }, method = RequestMethod.POST)
	public void emailJoblist(HttpServletResponse response, HttpSession session, ModelMap modelMap,
			HttpServletRequest request, @RequestParam("page") Integer page, @RequestParam("rows") Integer rows,
			@ModelAttribute SearchModel searchModel) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 20;
		}
		// 总共有多少条
		Integer count = emailJobService.getEmailJobSize(searchModel);
		// 总共有多少页
		Integer pageCount = ((count % rows == 0) ? (count / rows) : ((count / rows) + 1));
		List<EmailJob> emailJobs = emailJobService.getEmailJobList(page, rows, searchModel);
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取分页信息
		CommonUtils.getPageMap(map, page, pageCount);
		map.put("records", count);
		map.put("rowNum", rows);
		map.put("page", page);
		map.put("total", pageCount);
		map.put("rows", emailJobs);
		try {
			responseJson(response, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = { "/addEmailJob" }, method = RequestMethod.GET)
	public String addEmailJob(ModelMap model) {
		model.addAttribute("title", "添加任务");
		return "addJob";
	}

	@RequestMapping(value = { "/saveEmailJob" }, method = RequestMethod.POST)
	public void saveEmailJob(HttpServletResponse response, MailJobRule mailJobRule, ModelMap model) {
		String massage = "success";
		EmailJob emailJob = new EmailJob();
		emailJob.setJobName(mailJobRule.getJobName());
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		emailJob.setJobRule(gson.toJson(mailJobRule));
		emailJob.setEnd(0);
		emailJobService.saveEmailJob(emailJob);
		try {
			responseJson(response, massage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
