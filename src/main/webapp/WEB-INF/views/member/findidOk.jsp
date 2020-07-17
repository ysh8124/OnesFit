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
	<link rel="shortcut icon" href="/img/onesfitcon.png">

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
#member_findidresult { margin:14px 7px 0; padding:0 0 29px; color:#333; font-size:13px; }
#member_findidresult .info { padding:25px 21px 20px; border:px solid #d5d5d5; text-align:center; background:#fff; }
#member_findidresult .info p:last-child { margin:10px 0 0; }
#member_findidresult .info span { color:#508bed; font-size:15px; font-weight:bold; }
#member_findidresult .info strong { color:#508bed; font-weight:bold; }
#member_findidresult table { margin:7px auto 0; border:1px solid #d5d5d5; color:#353535; background:#fff; }
#member_findidresult th { width:80px; padding:0px 5px 14px 14px; text-align:left; color:#757575; font-weight:normal; vertical-align:middle; }
#member_findidresult td { padding:0px 14px 14px 14px; vertical-align:middle; }
#member_findidresult tr:first-child th,
#member_findidresult tr:first-child td { padding-top:14px; }
#member_findidresult .list { padding:14px; border:px solid #d5d5d5; border-top:none; background:#fff; }
#member_findidresult .btnArea.type2 { margin:14px auto 0; }

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
							<li><a href="">my page</a> <a href="">cart </a> <a href="">order</a>
							</li>

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

				<div id="member_findidresult">
					<!--@css(/css/module/member/findidresult.css)-->
					
					<div class="info">
						<p>
							<span>아이디 찾기가 완료되었습니다.</span>
						</p>
					</div>
					
					<table border="1" summary="">
						
					<p class="list">${id}</p>
					
					<div class="btnArea type2">
						<a href="/member/toLogin" class="btnSubmit">LOGIN</a>
						<a href="/member/topwfind" class="btnEm">FORGOT PW</a>
					</div>
					
					</table>
					
				</div>
				
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
				OWNER : 원에스핏 | WEB MANAGER : 이재원 <br> @ OSF ONESFIT

			</div>
		</div>

	</div>




</body>
</html>