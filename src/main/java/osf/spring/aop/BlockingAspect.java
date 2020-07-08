package osf.spring.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import osf.spring.dto.MemberDTO;

public class BlockingAspect {
   
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
   
   public Object blockingSignUp(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(session.getAttribute("loginid").equals("pzlogin")) {
         returnVal = (String)pjp.proceed();   
      }
      else {
         return "daily/warning";
      }
      return returnVal;
   }
   
   public Object blockingToLogin(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(session.getAttribute("loginid").equals("pzlogin")) {
         returnVal = (String)pjp.proceed();   
      }
      else {
         return "daily/warning";
      }
      return returnVal;
   }
   
   public Object blockingCart(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(session.getAttribute("loginid").equals("pzlogin")) { 
         return "daily/pzlogin";
      }
      else {
         returnVal = (String)pjp.proceed(); 
      }
      return returnVal;
   }
   
   public Object blockingPayMent(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(session.getAttribute("loginid").equals("pzlogin")) { 
         return "daily/pzlogin";
      }
      else {
         returnVal = (String)pjp.proceed(); 
      }
      return returnVal;
   }
   
   public Object blockingtomyPage(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(!(session.getAttribute("loginid").equals("pzlogin"))) {
         returnVal = (String)pjp.proceed();   
      }
      else {
         return "daily/pzlogin";
      }
      return returnVal;
   }
   
   public Object blockingtoProfile(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(!(session.getAttribute("loginid").equals("pzlogin"))) {
         returnVal = (String)pjp.proceed();   
      }
      else {
         return "daily/pzlogin";
      }
      return returnVal;
   }
   
   public Object blockingtoidfind(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(session.getAttribute("loginid").equals("pzlogin")) {
         returnVal = (String)pjp.proceed();   
      }
      else {
         return "daily/warning";
      }
      return returnVal;
   }
   
   public Object blockingtopwfind(ProceedingJoinPoint pjp) throws Throwable{
      String returnVal = null;
      
      if(session.getAttribute("loginid").equals("pzlogin")) {
         returnVal = (String)pjp.proceed();   
      }
      else {
         return "daily/warning";
      }
      return returnVal;
   }
   
   public Object blockingPayMent2(ProceedingJoinPoint pjp) throws Throwable{
	      String returnVal = null;
	      
	      if(session.getAttribute("loginid").equals("pzlogin")) { 
	         return "daily/pzlogin";
	      }
	      else {
	         returnVal = (String)pjp.proceed(); 
	      }
	      return returnVal;
	   }
	   
	   public Object blockingPayMent3(ProceedingJoinPoint pjp) throws Throwable{
	      String returnVal = null;
	      
	      if(session.getAttribute("loginid").equals("pzlogin")) { 
	         return "daily/pzlogin";
	      }
	      else {
	         returnVal = (String)pjp.proceed(); 
	      }
	      return returnVal;
	   }

}