package osf.spring.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminAdvisor {
	
	@Autowired
	private HttpSession session;

	public Object adminCheck(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal=null;
//		if(session.getAttribute("loginInfo") == "OSF") {
			returnVal = pjp.proceed().toString();
//		}else {
//			return "/notice/error";
//		}
		return returnVal;
	}
	
}
