package patronDAO;

import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import entidad.Email;

public class MySqlEmailDao implements EmailDAO{

	@Override
	public Email enviarcorreo(String receptor, String mensaje) {
		try {

			final String to = receptor;
			final String subject = "Enfermedad Subsidiada";
			//final String msg = mensaje;
			final String user = "javier.adama@gmail.com";
			final String pass = "Kbib_tw_110";

			Properties props = new Properties();

			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(user, pass);
						}
					});
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);			
	        MimeMultipart multipart = new MimeMultipart("related");

	        // first part  (the html)
	        BodyPart messageBodyPart = new MimeBodyPart();		      
	        messageBodyPart.setContent(mensaje, "text/html");

	        // add it
	        multipart.addBodyPart(messageBodyPart);	        
	        

	        // put everything together
	        message.setContent(multipart);
	        Transport.send(message);
	        System.out.println(mensaje);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
