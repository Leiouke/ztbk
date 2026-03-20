package com.cnpiecsb.common.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 跟发送邮件相关的工具包
 * 
 * @author user
 *
 */
public class EmailUtil {
	private static Logger logger = LogManager.getLogger(EmailUtil.class.getName());
	
	private static Properties prop = new Properties();
	
	private static String service = "smtphm.qiye.163.com"; // 邮件发送服务器
	
	static {
		prop.setProperty("mail.host", service);  
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.ssl.enable", "true");
		//prop.setProperty("mail.imaps.auth", "true");
//		prop.put("mail.smtp.port","994");
	}
	
	/**
	 * 这里的发送人统一为kehao.wang, 接收人和邮箱地址需要传入, 一次只能发一个地址
	 * 
	 * @param address
	 * @param content
	 */
	public static boolean sendEmail(String address, String subject, String content){
		try {
			Session session = Session.getInstance(prop);
			//开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
			session.setDebug(true);
			//2、通过session得到transport对象
			Transport ts = session.getTransport();
			//3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
			ts.connect(service, "it_notice@cnpiecsb.com", "6ay4vK1743MzYhvw");  // 这里放的密码是客户端授权密码 
			//4、创建邮件
			//创建邮件对象
			MimeMessage message = new MimeMessage(session);
			//指明邮件的发件人
			message.setFrom(new InternetAddress("it_notice@cnpiecsb.com"));
			//指明邮件的收件人，可以群发
			Address[] addresses = new Address[1];
			addresses[0] = new InternetAddress(address);
			message.addRecipients(Message.RecipientType.TO, addresses);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress("kehao.wang"));
			//邮件的标题
			message.setSubject(subject);
			//邮件的文本内容
			message.setContent(content, "text/html;charset=UTF-8");
			
			//5、发送邮件
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch(Exception e) {
			logger.info("发送邮件出错！邮件地址为：" + address + "。" + e); 
			//System.out.println(e);
			return false;
		}
		return true;
	}

}
