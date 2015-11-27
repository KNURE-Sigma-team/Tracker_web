package com.wimk.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.wimk.entity.Area;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;

public class EmailSender {

	private EmailSender() {
	}

	private static final String SENDER_EMAIL = "company.wimk@gmail.com";
	private static final String SENDER_PASSWORD = "Wimk.30102015";

	private static final String HIGH_PRIORITY = "1";
	private static final String COMMON_PRIORITY = "3";
	
	private static void sendEmail(String emailTo, String subject, String message, String xPriority) {
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
			mimeMessage.setContent(message, "text/html");
			mimeMessage.setHeader("X-Priority", xPriority);
			Transport.send(mimeMessage);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendSosMessage(String childName, String parentEmail, Point point, String wimkUrl){
		String subject = "Sos message from " + childName;
		StringBuilder message = new StringBuilder();
		message.append("Your child ").append(childName).append(" sent to <a href='").append(wimkUrl).append("'> WimK </a> SOS message. <br/>")
			.append("Address: ").append(Geodecoder.geodecode(point.getX(), point.getY())).append("<br/>")
			.append("Time: ").append(point.getTime());
		sendEmail(parentEmail, subject, message.toString(), HIGH_PRIORITY);
	}
	
	public static void sendMessageChildIntoForbiddenArea(String childName, String parentEmail, Point point, Area area, String wimkUrl){
		String subject = "Child " + childName + " into forbidden area";
		StringBuilder message = new StringBuilder();
		message.append("<a href='").append(wimkUrl).append("'> WimK </a> detected that your child came in forbiddenn area. <br/>")
			.append("<table><tr><td>Child: </td><td>").append(childName).append("</td></tr>")
			.append("<tr><td>Forbiddenn area: </td><td>").append(area.getName()).append("</td></tr>")
			.append("<tr><td>Address: </td><td>").append(Geodecoder.geodecode(point.getX(), point.getY())).append("</td></tr>")
			.append("<tr><td>Time: </td><td>").append(point.getTime()).append("</td></tr></table>");
		sendEmail(parentEmail, subject, message.toString(), HIGH_PRIORITY);
	}
	
	public static void sendMessageChildLeaveAllowedArea(String childName, String parentEmail, Point point, String wimkUrl){
		String subject = "Child " + childName + " outside allowed area";
		StringBuilder message = new StringBuilder();
		message.append("<a href='").append(wimkUrl).append("'> WimK </a> detected that your child came out from allowed areas. <br/>")
			.append("<table><tr><td>Child: </td><td>").append(childName).append("</td></tr>")
			.append("<tr><td>Address: </td><td>").append(Geodecoder.geodecode(point.getX(), point.getY())).append("</td></tr>")
			.append("<tr><td>Time: </td><td>").append(point.getTime()).append("</td></tr></table>");
		sendEmail(parentEmail, subject, message.toString(), HIGH_PRIORITY);
	}
	
	public static void sendRestorePasswordConfirmingCode(String email, String confirmingCode, String url){
		String subject = "Restore password";
		String message = "<div style='color:#000000'><div>Recently it received a request to restore your password in <a href='" + url + "'>WimK.</a></div>"
				+ "<br/><div>Input this code for restore password:</div>"
				+ "<div style='background-color:#F8F8FF; border:solid 1px black; font-size:20pt; display: inline-block' align='center'>" + confirmingCode + "</div></div>";
		sendEmail(email, subject, message, COMMON_PRIORITY);
	}
	
	public static void sendRegistrationConfirmEmail(Parent parent, String url, String hash) {
		String subject = "Activated accout";
		String siteAddress = url.substring(0, url.indexOf('/', url.indexOf("/register")));
		StringBuilder sb = new StringBuilder();
		sb.append("<div style='font-size:12pt'>Hello, ").append(parent.getName()).append("!<br/>")
				.append("Congratulations with the registration in <a href='").append(siteAddress).append("'>WimK</a><br/>")
				.append("To complete your registration, please visit this URL: </div>")
				.append("<div style='font-size:12pt'>").append(url).append("?login=").append(parent.getLogin()).append("&hash=").append(hash).append("</div><br/>")
				.append("<div style='font-size:10pt'>Attention!<br/>")
				.append("Account activation only at this link. <br/>")
				.append("You mustn't responding on this message <br/>")
				.append("You received this message because your e-mail address has been registered on the site <a href='").append(siteAddress).append("'>WimK</a><br/>") 
				.append("If you are not registered on this site, please ignore this letter. <br/>")
				.append("Best wishes, the site administration <a href='").append(siteAddress).append("'>WimK</a></div><br/>");
		sendEmail(parent.getLogin(), subject, sb.toString(), COMMON_PRIORITY);
	}
}