package com.unbank.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/")
@SessionAttributes("loggedinuser")
public class AdminHomeController extends CommonController {

	static final Logger logger = LoggerFactory.getLogger(AdminHomeController.class);

	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute("title", "首页");
		model.addAttribute("loggedinuser", getPrincipal());
		return "home";
	}

	@RequestMapping(value = { "/sender" }, method = RequestMethod.GET)
	public String sender(ModelMap model) {
		model.addAttribute("title", "发件人管理");
		model.addAttribute("loggedinuser", getPrincipal());
		return "sender";
	}

	@RequestMapping(value = { "/reiver" }, method = RequestMethod.GET)
	public String reiver(ModelMap model) {
		model.addAttribute("title", "收件人管理");
		model.addAttribute("loggedinuser", getPrincipal());
		return "reiver";
	}

	@RequestMapping(value = { "/email" }, method = RequestMethod.GET)
	public String email(ModelMap model) {
		model.addAttribute("title", "内容管理");
		model.addAttribute("loggedinuser", getPrincipal());
		return "email";
	}

	@RequestMapping(value = { "/job" }, method = RequestMethod.GET)
	public String job(ModelMap model) {
		model.addAttribute("title", "任务管理");
		model.addAttribute("loggedinuser", getPrincipal());
		return "job";
	}

}
