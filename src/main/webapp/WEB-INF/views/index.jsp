<%@ page language='java' contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
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

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<style>
* {
	box-sizing: border-box
}

div {
	border: 0px solid black
}

/*    모든 영역*/
#container {
	height: 1500px
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

#sidefix {
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
	height: 1500px;
	margin-left: 340px
}

#product_ul {
	list-style: none;
	display: table;
}

.product_info {
	list-style: none;
	font-size: 12px;
}

.box_div img {
	width: 375px;
	height: 400px;
	padding: 8px
}

.box_div img:hover {
	opacity: 50%
}

.box_li {
	float: left;
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
<body>
	<!--       전체 영역-->
	<div id=OSF_ALL>
		<!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
		<div id="container">

			<!--               사이드메뉴-->
			<c:choose>
				<c:when test="${loginInfo eq 'pzlogin'}">
					<div id="sidemenu">
						<div id="sidefix">
							<a href="/"> <img src="/img/logo.png"
								style="width: 130px; position: relative; left: 45px">
							</a>
							<div class="memberpage">
								<ul>
									<li><a href="/member/toLogin">login</a> <a href="/member/toSignup">join us</a></li>
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
									<li><a href=""><img src="/img/search.png"
											style="width: 15px"></a> <input id="search" type="text">
									</li>
								</ul>
								<ul>
									<li><a href="https://www.instagram.com/onesfit__official/?hl=ko" onclick="window.open(this.href,'_blank'); return false;"><img src="/img/instar.png"
											width="20px"
											style="position: relative; top: 6px; border-radius: 9px"></a>
										<a href=""><img src="/img/kakao.png"
											width="20px"
											style="position: relative; top: 6px; border-radius: 9px"></a>
									</li>
								</ul>


							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div id="sidemenu">
						<div id="sidefix">
							<a href=""> <img src="/img/logo.png"
								style="width: 130px; position: relative; left: 45px">
							</a>
							<div class="memberpage">
								<ul>
									<li><a href="/member/logout">logout</a> <a
										href="/member/toProfile?id=${loginInfo}">PROFILE</a></li>
									<li><a href="/member/tomyPage">my page</a> <a href="/member/cart?parent_id=${loginInfo.id}">cart </a> <a href="">order</a>
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
									<li><a href="/daily/daily_list?page=1" style="font-size: 11px;">OSF DAILY LOOK</a>
									<li><a href="/notice/notice_list?page=1" style="font-size: 11px;">NOTICE</a>
									</li>
									<c:choose>
										<c:when test="${loginInfo.id eq 'OSF'}">
										<li><a href="/admin/productAdd">상품등록</a>
									</c:when>
									<c:otherwise>
									
									</c:otherwise>
									</c:choose>
									
								</ul>
							</div>

							<div>
								<ul>
									<li><a href=""><img src="/img/search.png"
											style="width: 15px"></a> <input id="search" type="text">

									</li>
								</ul>
								<ul>
									<li><a href="https://www.instagram.com/onesfit__official/?hl=ko" onclick="window.open(this.href,'_blank'); return false;"><img src="/img/instar.png"
											width="20px"
											style="position: relative; top: 6px; border-radius: 9px"></a>
										<a href=""><img src="/img/kakao.png"
											width="20px"
											style="position: relative; top: 6px; border-radius: 9px"></a>
									</li>
								</ul>


							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

					<!--               중앙 내용-->
					<div id="contents">
						<div style="position: relative; top: 50px; text-align: center;">
							<ul id="product_ul">
								<c:forEach var='i' items='${products}'>
									<li class="box_li">
										<div class="box_div">
											<a href="/product/productDetail?pseq=${i.pseq}"><img
												src="/title/${i.title_img}"></a>
											<ul class="product_info">
												<li>${i.pname}</li>
												<li>${i.price}</li>
											</ul>
										</div>
									</li>
								</c:forEach>
								<!-- <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_143948602.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li> 
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_143948602_01.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li>
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_094535001_01.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li> 
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_094535001_05.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li> 
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_094535001_06.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li>   
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_094535001_03.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li>    
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_094535001_07.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li>    
                            <li  class="box_li">
                                <div class="box_div">
                                    <a href=""><img src="image/KakaoTalk_20200622_094535001_04.jpg"></a>
                                    <ul id="product_info">
                                        <li>제품명</li>
                                        <li>가격</li>
                                    </ul>
                                </div>                           
                            </li>    -->
							</ul>
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
				OWNER : 원에스핏 | WEB MANAGER : 잊재웡 <br> @ OSF ONESFIT

			</div>
		</div>
	</div>
</body>
</html>