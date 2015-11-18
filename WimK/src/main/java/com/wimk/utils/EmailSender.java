package com.wimk.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {

	private EmailSender() {
	}

	private static final String SENDER_EMAIL = "company.wimk@gmail.com";
	private static final String SENDER_PASSWORD = "Wimk.30102015";

	private static void sendEmail(String emailTo, String subject, String message) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
			}
		});

		try {
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(SENDER_EMAIL));
			mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(message);

			Transport.send(mimeMessage);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendSosMessage(String childName, String parentEmail){
		String subject = "Sos message from " + childName;
		String message = "Your child " + childName + " sent to our service sos message.";
		sendEmail(parentEmail, subject, message);
	}
	
	public static void sendMessageChildIntoForbiddenArea(String childName, Date date, String parentEmail){
		String subject = "Child " + childName + " into forbidden area";
		String message = "Child " + childName + " is into forbidden area. " + date.toString();
		sendEmail(parentEmail, subject, message);
	}
	
	public static void sendMessageChildLeaveAllowedArea(String childName, Date date, String parentEmail){
		String subject = "Child " + childName + " outside allowed area";
		String message = "Child " + childName + " is outside allowed area. " + date.toString();
		sendEmail(parentEmail, subject, message);
	}
	
	public static void sendRestorePasswordConfirmingCode(String email, String password){
		String subject = "Restore password";
		String message = "Recently it received a request to restore your password in WimK.\nInput this code for restore password:\n" + password;
		sendEmail(email, subject, message);
	}
}
