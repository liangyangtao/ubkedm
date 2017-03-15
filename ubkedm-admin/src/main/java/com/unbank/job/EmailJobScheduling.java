package com.unbank.job;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.atomic.AtomicInteger;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.unbank.email.MailSenderInfo;
import com.unbank.email.MyAuthenticator;
import com.unbank.mybatis.entity.EmailInfo;
import com.unbank.mybatis.entity.EmailReiver;
import com.unbank.mybatis.entity.EmailSender;
import com.unbank.web.model.SearchModel;
import com.unbank.web.service.EmailInfoService;
import com.unbank.web.service.EmailJobService;
import com.unbank.web.service.EmailReiverService;
import com.unbank.web.service.EmailSenderService;

@Component
//@EnableScheduling
public class EmailJobScheduling {
	static final Logger logger = LoggerFactory.getLogger(EmailJobScheduling.class);
	@Autowired
	EmailReiverService emailReiverService;
	@Autowired
	EmailSenderService emailSenderService;
	@Autowired
	EmailJobService emailJobService;
	@Autowired
	EmailInfoService emailInfoService;

	public static AtomicInteger atomicInteger = new AtomicInteger(0);

//	@Scheduled(fixedDelay = 400000)
	public void dojob() {

		MailSenderInfo mailInfo = fillMailInfo();
		if (mailInfo != null) {

			boolean isSend = sendHtmlMail(mailInfo);
		}
	}

	public boolean sendHtmlMail(MailSenderInfo mailInfo) {
		// 判断是否需要身份认证
		MyAuthenticator authenticator = null;
		Properties pro = mailInfo.getProperties();
		// 如果需要身份认证，则创建一个密码验证器
		if (mailInfo.isValidate()) {
			authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getDefaultInstance(pro, authenticator);
		try {
			// 根据session创建一个邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			InternetAddress from = new InternetAddress(mailInfo.getFromAddress());
			// 设置邮件消息的发送者
			mailMessage.setFrom(from);
			// 创建邮件的接收者地址，并设置到邮件消息中
			// 邮件接收人
			if (mailInfo.getReceivers() != null && mailInfo.getReceivers().size() > 0) {
				String addressList = getMailList(mailInfo.getReceivers());
				InternetAddress[] receiverAddresses = new InternetAddress().parse(addressList);
				mailMessage.setRecipients(Message.RecipientType.TO, receiverAddresses);
			}
			// 邮件抄送人
			if (mailInfo.getCcReceivers() != null && mailInfo.getCcReceivers().size() > 0) {
				String addressList = getMailList(mailInfo.getCcReceivers());
				InternetAddress[] receiverAddresses = new InternetAddress().parse(addressList);
				mailMessage.setRecipients(Message.RecipientType.CC, receiverAddresses);
			}

			// 设置邮件消息的主题
			mailMessage.setSubject(mailInfo.getSubject());
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
			Multipart mainPart = new MimeMultipart();
			// fujian

			// 创建一个包含HTML内容的MimeBodyPart

			MimeBodyPart htmlpart = new MimeBodyPart();
			htmlpart.setContent(mailInfo.getContent(), "text/html; charset=utf-8");
			mainPart.addBodyPart(htmlpart);
			// 将MiniMultipart对象设置为邮件内容
			if (mailInfo.getPictures() != null && mailInfo.getPictures().length > 0) {
				String[] pictures = mailInfo.getPictures();
				for (int i = 0; i < pictures.length; i++) {
					String piturePath = pictures[i];
					BodyPart imgBodyPart = new MimeBodyPart();
					DataSource source = new FileDataSource(piturePath);
					DataHandler imgDataHandler = new DataHandler(source);
					imgBodyPart.setDataHandler(imgDataHandler);
					// 注意：Content-ID的属性值一定要加上<>，不能是touxiang.jpg
					imgBodyPart.setHeader("Content-ID", "<" + MimeUtility.encodeText(source.getName()) + ">");
					// 为图片设置文件名，有的邮箱会把html内嵌的图片也当成附件
					imgBodyPart.setFileName(MimeUtility.encodeText(source.getName()));
					mainPart.addBodyPart(imgBodyPart);
				}
			}

			if (mailInfo.getAttachFileNames() != null && mailInfo.getAttachFileNames().length > 0) {
				String[] files = mailInfo.getAttachFileNames();
				for (int i = 0; i < files.length; i++) {
					String filepath = mailInfo.getAttachFileNames()[i];
					BodyPart messageBodyPart = new MimeBodyPart();
					DataSource source = new FileDataSource(filepath);
					// 添加附件的内容
					messageBodyPart.setDataHandler(new DataHandler(source));
					// 添加附件的标题
					messageBodyPart.setFileName(MimeUtility.encodeText(source.getName()));
					mainPart.addBodyPart(messageBodyPart);
				}

			}
			mailMessage.setContent(mainPart);
			// 发送邮件
			Transport.send(mailMessage);
			return true;
		} catch (MessagingException ex) {
			ex.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return false;
	}

	private MailSenderInfo fillMailInfo() {
		EmailInfo emailInfo = emailInfoService.getEmailInfoById(1);
		int infoid = emailInfo.getId();
		String title = emailInfo.getTitle();
		String content = emailInfo.getContent();
		// 如何选取 收件人,轮循来么？

		// 发件人 风险预警

		SearchModel searchModel = new SearchModel();
		searchModel.setRank(0);
		int uid = atomicInteger.incrementAndGet();
		EmailReiver emailReiver = emailReiverService.getEmailReiverByid(uid);
		if (emailReiver == null) {
			return null;
		}

		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);

		int count = emailSenderService.getEmailSenderSize(searchModel);
		int sendid = (int) (1 + Math.random() * (count - 1 + 1));
		System.out.println(sendid);
		EmailSender sender = emailSenderService.getEmailSenderByid(sendid);
		if (sender == null) {
			return null;
		}
		String username = sender.getName();
		String password = sender.getPassword();

		mailInfo.setUserName(username);
		mailInfo.setPassword(password);// 您的邮箱密码
		mailInfo.setFromAddress(username);
		List<String> address = new ArrayList<String>();
		address.add(emailReiver.getName());
		// 添加邮件接收人
		mailInfo.setReceivers(address);
		// 添加邮件抄送人
		mailInfo.setSubject(title);
		content = content.replace("@@@uid@@@", uid + "");
		content = content.replace("@@@edm@@@", infoid + "");
		mailInfo.setContent(content.toString());
		logger.info(username + "  " + password + "====>" + emailReiver.getName());
		return mailInfo;
	}

	// 获取收件人地址
	private String getMailList(List<String> list) {
		StringBuffer sb = new StringBuffer();
		for (String s : list) {
			sb.append(s);
			sb.append(",");
		}
		sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}

}
