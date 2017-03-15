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

import com.unbank.mybatis.entity.EmailReiver;
import com.unbank.util.CommonUtils;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailReiverService;
import com.unbank.web.service.UserService;

@Controller
@RequestMapping("/")
public class EmailReiverController extends CommonController {

	@Autowired
	UserService userService;
	@Autowired
	EmailReiverService emailReiverService;

	@RequestMapping(value = { "emailReiverlist" }, method = RequestMethod.POST)
	public void emailReiverlist(HttpServletResponse response, HttpSession session, ModelMap modelMap,
			HttpServletRequest request, @RequestParam("page") Integer page, @RequestParam("rows") Integer rows,
			@ModelAttribute SearchModel searchModel) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 20;
		}
		// 总共有多少条
		Integer count = emailReiverService.getEmailReiverSize(searchModel);
		// 总共有多少页
		Integer pageCount = ((count % rows == 0) ? (count / rows) : ((count / rows) + 1));
		List<EmailReiver> emailSenders = emailReiverService.getEmailReiverList(page, rows, searchModel);
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取分页信息
		CommonUtils.getPageMap(map, page, pageCount);
		map.put("records", count);
		map.put("rowNum", rows);
		map.put("page", page);
		map.put("total", pageCount);
		map.put("rows", emailSenders);
		try {
			responseJson(response, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = { "/addReiver" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		model.addAttribute("title", "添加收件人");
		return "addReiver";
	}

}
