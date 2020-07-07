package osf.spring.statics;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail3 {
	public static int gmailSend(String mail) {
        String user = GmailLogin.GMAIL_LOGIN_ID; 
        String password = GmailLogin.GMAIL_LOGIN_PW;   

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");       
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        int code=0;
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

           
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail)); 

            // Subject
            message.setSubject("비밀번호 찾기 인증 코드입니다."); 
            code = (int)((Math.random()*10000)+1000);
            // Text
            message.setText("인증 코드 : "+code);   

            // send the message
            Transport.send(message); 
            System.out.println("message sent successfully...");
            
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return code;
    }
}
