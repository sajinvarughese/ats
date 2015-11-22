package org.ats.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	 public static boolean sendMail(String to,String subject,String content){
	      	boolean result = false;
	        final String username = "unisavedevops1234@gmail.com";
			final String password = "umn123456";
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
	        System.out.println(props.getProperty("mail.smtp.host"));
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
			
			try {
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("emailid"));
				message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));
				message.setSubject(subject);
				message.setText(content);
				Transport.send(message);
				result = true;
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
			return result;
	    }
}
