<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>idfind</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<style>
* {
	box-sizing: border-box;
}

a {
	color: black;
}

input {
	border: 1px solid #dedede;
}

div {
	border: px solid black
}

/*    모든 영역*/
#container {
	height: 800px
}

/*    왼쪽 메뉴*/
#sidemenu {
	float: left;
	width: 271px;
	position: fixed;
	left: 50px;
	padding: 32px 0 10px 50px;
	border: 0px;
}

#sidefix ul {
	list-style: none;
}

#sidefix ul li a {
	text-decoration: none;
	color: black;
	position: relative;
	display: inline-block;
	margin: 7px;
	color: #000;
	font-size: 11px;
	text-transform: uppercase;
}

#sidefix ul li a:hover {
	opacity: 50%
}

#category ul li a {
	font-size: 11px;
}

#search {
	width: 110px;
	height: 17px;
	border: 0;
	vertical-align: middle;
	background: none;
	border-bottom: 1px solid #3e3e3e;
}

/*    중앙 내용*/
#contents {
	float: left;
	width: 1212px;
	height: 300px;
	margin-left: 340px;
	font-size: 11px;
	text-align: center;
	margin-top: 150px;
}

#contents li {
	list-style: none;
}

#login input {
	width: 250px;
	height: 35px;
	border: 1px solid black;
}

#login a {
	font-size: 13px;
	padding: 3px;
}

/*    오른쪽 메뉴*/
#rightmenu {
	float: left;
	width: 250px;
	position: fixed;
	right: 130px;
	padding: 49px 80px 0px 0px;
	text-align: right;
}

#rightmenu ul li {
	text-decoration: none;
	color: black;
	display: inline-block;
	margin: 0px 0px 5px 0;
	font-size: 11px;
	text-transform: uppercase;
}

/*        FOOTER*/
.footer {
	font-size: 11px;
	text-align: center;
}

.footer a {
	text-decoration: none;
	color: black;
}
</style>


</head>
<body>

	<!--       전체 영역-->
	<div id=OSF_ALL>
		<!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
		<div id="container">

			<!--               사이드메뉴-->
			<div id="sidemenu">
				<div id="sidefix">
					<a href="/"> <img src="/img/logo.png" style="width: 130px; position: relative; left: 45px">
					</a>
					<div class="memberpage">
						<ul>
							<li><a href="/member/toLogin">login</a>
							<a href="/member/toSignup">join us</a></li>
							
						</ul>
					</div>

					<div id="category">
						<ul>
							<li><a href="">NEW ARRIVAL</a></li>
							<li><a href="">BEST ITEM</a></li>
							<li><a href="">OUTERWEAR</a></li>
							<li><a href="">TOP</a></li>
							<li><a href="">PANTS</a></li>
							<li><a href="">ACC</a></li>
							<li><a href="/daily/daily_list?page=1" style="font-size: 11px;">OSF DAILY LOOK</a></li>
<li><a href="/notice/notice_list?page=1" style="font-size: 11px;">NOTICE</a></li>

						</ul>
					</div>

					<div>
						<ul>
                               <li><a href=""><img src="/img/search.png" style="width: 15px"></a> <input id="search" type="text"></li>
                            </ul>
                            <ul>
                                <li><a href="https://www.instagram.com/onesfit__official/?hl=ko" onclick="window.open(this.href,'_blank'); return false;"><img src="/img/instar.png" width="20px" style="position: relative; top: 6px; border-radius: 9px"></a> 
									<a href=""><img src="/img/kakao.png" width="20px" style="position: relative; top: 6px; border-radius: 9px"></a>
								</li>
                            </ul>


					</div>
				</div>
			</div>

			<!--               중앙 내용-->
			<div id="contents">
				<form action="/member/findId" method="post">
					<div id="login">
						<fieldset>
							<div class="xans-element- xans-member xans-member-findid">
								<!--
$returnURL = /member/id/find_id_result.html
-->
								<div class="findId">
									<div style="position: relative; left: 19px">
										<h5>
											<b>아이디 찾기</b>
										</h5>
									</div>
									<br>
									<ul style="font-size: 11px;">

										<li>EMAIL을 통해 아이디 찾기가 가능 합니다. <br>
										</li>

									</ul>
									<div></div>

									<fieldset>
										<div>
											<ul>
												<li><label><input placeholder="NAME 입력"
														type="text" name="name" id="name"></label></li>
												<li><label><input type="text"
														placeholder="EMAIL 입력" name="email" id="email"></label></li>

												<li><label> <input type="text"
														placeholder="인증번호 입력" id=btntext style="width: 180px">
												</label> <label> <input type="button" id="btn" value="인증받기"
														style="width: 68px; background-color: white; border-radius: 5px; border: 2px solid black;">
												</label></li>


											</ul>
										</div>

										<div class="login_btn">
											<ul>
												<li><a href=""><button type="submit"
															class="btn btn-dark" style="font-size: 11px" id="idsign"
															value="아이디 찾기">아이디 찾기</button></a></li>
											</ul>
										</div>
										
									</fieldset>
								</div>
							</div>
						</fieldset>
					</div>
				</form>



			</div>
			<div id="rightmenu">
				<ul>
					<li><b>OPENING</b></li>
					<br>
					<li class="phone">T. 02-777-7777</li>
					<li class="font10">MON-FRI / 11AM - 5PM</li>
					<li class="font10">lunch / 1AM - 2PM</li>
					<li class="font10">(close, sat sun holiday)</li>
				</ul>


				<ul>

				</ul>
				<ul>
					<li><b>BANK INFO</b></li>
					<br>
					<li>국민 5591-010-4168-906</li>
					<li>ONESFIT (권성택)</li>
				</ul>
			</div>
		</div>

		<br>

		<div class="footer">
			<a href="">사이트 소개</a> | <a href="">이용약관</a> | <a href="">개인정보취급방침</a>
			| <a href="">이메일 무단수집거부</a> | <a href="">책임의 한계와 법적고지</a> | <a
				href="">이용안내</a> | <a href="">모바일 버전</a> <br> <br>
			<div>
				COMPANY : ONESFIT <br> PHONE : 010-7777-7777 <br> 사업자 번호 :
				145-51-00571 <br> 주소 : 강원도 원주시 우산동 상지대길 9 (402호) <br>
				OWNER : 원에스핏 | WEB MANAGER : 잊재웡 <br> @ OSF ONESFIT

			</div>
		</div>

	</div>
	
	<script>
	  var code = 0;
     $("#btn").on("click", function() {
         if ($("#email").val() == "") {
             alert("이메일을 입력해주십시오.");
             $("#email").focus();
         }
         else {
             $.ajax({
                 url: "/member/emailcode2",
                 dataType: "json",
                 data: {
                     email: $("#email").val()
                 }
             }).done(function(resp) {
             	alert("인증번호 발송 완료");
             	code = resp.code;
             })
         }
     }) 
     
     $("#idsign").on("click",function(){
    	 if($("#name").val()==""){
    		 alert("이름을 입력해주세요.")
    		 return false;
    	 }
    	 if($("#email").val()==""){
    		 alert("이메일을 입력해주세요.")
    		 return false;
    	 }
    	 if($("#btntext").val()==""){
    		 alert("인증코드를 입력해주세요.")
    		 return false;
    	 }
    	 if($("#btntext").val()!= code) {
	            alert("메일 인증코드가 다릅니다.");
	            return false;
			}
    	 return true;
     })    
     
    /*   $("#idsign").on("click",function(){
    	  var responseMessage = "<c:out value="${id}" />";
          if(responseMessage != ""){
              alert(responseMessage)
          }
     }) */
     
	</script>


</body>
</html>