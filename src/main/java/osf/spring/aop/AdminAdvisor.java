package osf.spring.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import osf.spring.dto.MemberDTO;

public class AdminAdvisor {
	
	@Autowired
	private HttpSession session;

	public Object adminCheck(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal=null;


		if(session.getAttribute("loginid").equals("OSF")) {
			returnVal = pjp.proceed().toString();
		}else {
			return "/notice/error";
		}
		return returnVal;
	}
	
}
