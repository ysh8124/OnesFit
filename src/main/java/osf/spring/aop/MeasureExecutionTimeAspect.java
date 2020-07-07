package osf.spring.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import osf.spring.dto.MemberDTO;

public class MeasureExecutionTimeAspect {
	
	@Autowired
	private HttpSession session;
	
	public Object blockingNoticeWrite(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal = null;
		
		
		
		if(session.getAttribute("loginid").equals("OSF")) {
			returnVal = (String)pjp.proceed();   
		}
		else {
			return "notice/error";
		}
		return returnVal;
	}
	
	public Object blockingNoticeModify(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal = null;
		
		if(session.getAttribute("loginid").equals("OSF")) {
			returnVal = (String)pjp.proceed();   
		}
		else {
			return "notice/error";
		}
		return returnVal;
	}
	
	public Object blockingDailyWrite(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal = null;
		
		if(!(session.getAttribute("loginid").equals("pzlogin"))) {
			returnVal = (String)pjp.proceed();   
		}
		else {
			return "daily/pzlogin";
		}
		return returnVal;
	}
	
	public Object blockingDailyModify(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal = null;

		if(!(session.getAttribute("loginid").equals("pzlogin"))) {
			returnVal = (String)pjp.proceed();   
		}
		else {
			return "daily/pzlogin";
		}
		return returnVal;
	}
	
	public Object pzLoginDailyView(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal = null;
		
		if(!(session.getAttribute("loginid").equals("pzlogin"))) {
			returnVal = (String)pjp.proceed();   
		}
		else {
			return "daily/pzlogin";
		}
		return returnVal;
	}
	
	public Object blockingDailyDelete(ProceedingJoinPoint pjp) throws Throwable{
		String returnVal = null;
		
		if(!(session.getAttribute("loginid").equals("pzlogin"))) {
			returnVal = (String)pjp.proceed();   
		}
		else {
			return "daily/warning";
		}
		return returnVal;
	}

}
