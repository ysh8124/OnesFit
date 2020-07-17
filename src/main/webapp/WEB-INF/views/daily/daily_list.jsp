<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <link rel="shortcut icon" href="/img/onesfitcon.png">
    <script>
	$(function() {
		$("#btn").on("click", function() {
			location.href = "../daily/write";
		});
		
		$(".tab").on("click", function() {
            $(".box_li").css("display", "block");
            var tab = $(this).val();
            var tab2 = "";
            if (tab == 1) {
               tab2 = "new";
            }
            if (tab == 2) {
               tab2 = 'Y';
            }
            if (tab == 3) {
               tab2 = "outer";
            }
            if (tab == 4) {
               tab2 = "top";
            }
            if (tab == 5) {
               tab2 = "bottom";
            }
            if (tab == 6) {
               tab2 = "acc";
            }

            location.href="/?tab2="+tab2;
         })
	});
	</script>
    </head>
    <style>
    @font-face { font-family: 'S-CoreDream-6Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); font-weight: normal; font-style: normal; }
        *{box-sizing: border-box}
        div{border: 0px solid black}
		

        /*    모든 영역*/
        #container{height: 740px}

        /*    왼쪽 메뉴*/
        #sidemenu{float: left; width: 271px; position: fixed; left: 50px; padding: 32px 0 10px 50px; border: 0px;}
        #sidefix{border: 0px;}

        #sidefix ul{list-style: none;}
        #sidefix ul li a{
            text-decoration: none; 
            color: black; 
            position: relative;
            display: inline-block;
            margin: 7px;
            color: #000;
            font-size: 11px;        
            text-transform: uppercase;                     
        }
        #sidefix ul li a:hover{opacity: 50%}
        #category ul li a{font-size: 11px;}
        #search{
            width: 110px;
            height: 17px;
            border: 0;
            vertical-align: middle;
            background: none;
            border-bottom: 1px solid #3e3e3e;
        }

        /*    중앙 내용*/
        #contents{float: left; width: 825px; height: 740px; margin-left: 28%; margin-top: 57px; font-size: 13px;}

        #product_ul{list-style: none; display: table;}
        #product_info{list-style: none; font-size: 12px;}
        .box_div img{width: 375px; height: 400px; padding: 8px}

        .box_div img:hover{opacity: 50%}

        .box_li {float: left;}

        /*    오른쪽 메뉴*/
        #rightmenu{float:left; width: 250px; position: fixed; right:130px; padding: 49px 80px 0px 0px; text-align: right;}
        #rightmenu ul li{
            text-decoration: none; 
            color: black; 
            display: inline-block;
            margin: 0px 0px 5px 0;
            font-size: 11px;
            text-transform: uppercase;                     
        }

        /*        FOOTER*/
        .footer {font-size: 11px; text-align: center;}
        .footer a{text-decoration: none; color: black;}
         .nheader{
		 float: left;
		 text-align: center;
		 margin-top: 20px;
		 background-color: #f6f6f6;
		 height: 25px;
		 line-height: 24px;
	 	 }
	 
	     .ncontents{
		 float: left;
		 text-align: center;
		 line-height: 24px;
		 margin-bottom: 12px;
	 	 }
	 	 .ncontents>a{
	 	 padding: 10px;
	 	
	 	 }
	 	 .ncontents>a>img{
	 	 width : 400px;
	 	 height: 430px;
	 	 }
		
	     #btn{
	     border: 1px solid #c4c4c4; background-color: rgba(266,266,266,0); color: #c4c4c4; padding: 5px;
	     }
	     #btn:hover{
	 	 opacity: 50%;
	     }
	     .grid-container {
		 display: grid;
		 grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
		 grid-gap: 1em;
		 }
	     .location-listing{
	     margin-left : 12px;
	     position : absolute;
	     width: 400px;
	     height: 430px;
	     color: white;
	     }
	     .location-title{
	     align-items: center;
	     display:block;
	     width: 100%;
	     height: 100%;
	     font-size: 22px;
  		 font-family: 'S-CoreDream-6Bold';
  		 color: white;
	     background: rgba(167,167,167,0.4);
	     opacity: 0;
		 transition: opacity .5s;
		 line-height: 400px;
	     }
	     .location-listing:hover .location-title{
  		 opacity: 1;
  		 text-decoration: none;
  		 color: white;
  		 line-height: 400px;
		 }
		 #btn{
		 border: 1px solid #c4c4c4; background-color: rgba(125,125,125,0); color: #7d7d7d; padding: 5px; width: 100px; height: 35px;
		 }
		 #btn:hover{
	 	 opacity: 50%;
	     }

    </style>
    <body>
        <!--       전체 영역-->
        <div id=OSF_ALL>
            <!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
            <div id="container">

                 <!--               사이드메뉴-->
         <c:choose>
            <c:when test="${loginid eq 'pzlogin'}">
               <div id="sidemenu">
                  <div id="sidefix">
                     <a href="/"> <img src="/img/logo.png"
                        style="width: 130px; position: relative; left: 45px">
                     </a>
                     <div class="memberpage">
                        <ul>
                           <li><a href="/member/toLogin">login</a> <a
                              href="/member/toSignup">join us</a></li>
                        </ul>
                     </div>

                     <div id="category">
                        <ul>
                           <li value="1" class="tab"><a href="#">NEW ARRIVAL</a></li>
                           <li value="2" class="tab"><a href="#">BEST ITEM</a></li>
                           <li value="3" class="tab"><a href="#">OUTERWEAR</a></li>
                           <li value="4" class="tab"><a href="#">TOP</a></li>
                           <li value="5" class="tab"><a href="#">PANTS</a></li>
                           <li value="6" class="tab"><a href="#">ACC</a></li>
                           <li><a href="/daily/daily_list?page=1"
                              style="font-size: 11px;">OSF DAILY LOOK</a></li>
                           <li><a href="/notice/notice_list?page=1"
                              style="font-size: 11px;">NOTICE</a></li>
                        </ul>
                     </div>

                     <div>
                       <ul>
									<li><a
										href="https://www.instagram.com/onesfit__official/?hl=ko"
										onclick="window.open(this.href,'_blank'); return false;">
											<img src="/img/instar.png" width="20px"
											style="position: relative; top: 6px; border-radius: 9px">
									</a> <a
										href="https://open.kakao.com/me/onesfit"
										onclick="window.open(this.href,'_blank'); return false;"
										id='kakaotest'>
											<img src="/img/kakao.png" width="20px"
											style="position: relative; top: 6px; border-radius: 9px">
									</a>
										<a
										href="https://smartstore.naver.com/onesfit?NaPm=ct%3Dkccxj1zn%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3D53dd1f37c78f4e235605b9617da325dbbf14a4a1"
										onclick="window.open(this.href,'_blank'); return false;"><img
											src="/img/naver.png" width="20px"
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
                     <a href="/"> <img src="/img/logo.png"
                        style="width: 130px; position: relative; left: 45px">
                     </a>
                     <div class="memberpage">
                        <ul>
                           <li><a href="/member/logout">logout</a> <a
                              href="/member/toProfile?id=${loginInfo.id}">PROFILE</a></li>
                           <li><a href="/member/tomyPage">my page</a> <a
                              href="/member/cart?parent_id=${loginInfo.id}">cart </a> <a
                              href="/member/orderList?id=${loginid }">order</a></li>

                        </ul>
                     </div>

                     <div id="category">
                        <ul>
                           <li value="1" class="tab"><a href="#">NEW ARRIVAL</a></li>
                           <li value="2" class="tab"><a href="#">BEST ITEM</a></li>
                           <li value="3" class="tab"><a href="#">OUTERWEAR</a></li>
                           <li value="4" class="tab"><a href="#">TOP</a></li>
                           <li value="5" class="tab"><a href="#">PANTS</a></li>
                           <li value="6" class="tab"><a href="#">ACC</a></li>
                           <li><a href="/daily/daily_list?page=1"
                              style="font-size: 11px;">OSF DAILY LOOK</a>
                           <li><a href="/notice/notice_list?page=1"
                              style="font-size: 11px;">NOTICE</a></li>
                           <c:choose>
                              <c:when test="${loginid eq 'OSF'}">
                                 <li><a href="/admin/adminMain">관리자PAGE</a>
                              </c:when>
                              <c:otherwise>

                              </c:otherwise>
                           </c:choose>

                        </ul>
                     </div>

                     <div>

                       <ul>
									<li><a
										href="https://www.instagram.com/onesfit__official/?hl=ko"
										onclick="window.open(this.href,'_blank'); return false;">
											<img src="/img/instar.png" width="20px"
											style="position: relative; top: 6px; border-radius: 9px">
									</a> <a
										href="https://open.kakao.com/me/onesfit"
										onclick="window.open(this.href,'_blank'); return false;"
										id='kakaotest'>
											<img src="/img/kakao.png" width="20px"
											style="position: relative; top: 6px; border-radius: 9px">
									</a>
										<a
										href="https://smartstore.naver.com/onesfit?NaPm=ct%3Dkccxj1zn%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3D53dd1f37c78f4e235605b9617da325dbbf14a4a1"
										onclick="window.open(this.href,'_blank'); return false;"><img
											src="/img/naver.png" width="20px"
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
                <div style="font-size: 15px;"><b>OneSFitDailyLook</b></div>
                <hr style="width: 100%; margin-left: 5px; margin-bottom: 20px;">
                <c:forEach var="i" items="${list}">
         		
         		<div style="width: 100%;">
         		<div class="ncontents" style="width: 50%;">
         		<div class="location-listing">
         		<a class="location-title" href="view?d_seq=${i.d_seq}&page=${page}"># ${i.writer}</a>
         		</div>
         		<a href="view?d_seq=${i.d_seq}" id="n_hover" style="text-decoration: none; color: #585858">
         		<img src="../OSF/${i.writer}/${i.sysname}/">
         		</a>
         		</div>
         		</div>
        		</c:forEach>
        		
        		<div style="width: 1000px; float: left; margin-left: 87.5%;">
        		<input type="button" value="글쓰기" id="btn">
        		</div>
        		
        		<div style="width: 1000px; float: left; padding-left: 49.5%;">
        		<div style="width: 100%;">
        		<div style="width: 100%; margin-top: 10px;">${navi}</div>
                </div>
        		</div>
        		
        		<hr style="width: 100%; margin-left: 1px; margin-bottom: 20px; float: left;">
        		<div style="width: 1000px; float: left;">
        		
        		<div class="footer" style="width: 100%;  margin-bottom: 30px; margin-top: 20px; padding-right: 17%;">
                <a href="">사이트 소개</a> |
                <a href="">이용약관</a> |
                <a href="">개인정보취급방침</a> |
                <a href="">이메일 무단수집거부</a> |
                <a href="">책임의 한계와 법적고지</a> |
                <a href="">이용안내</a> |
                <a href="">모바일 버전</a>
                <br>
                <br>
                <div>
                    COMPANY : ONESFIT
                    <br> PHONE : 010-7777-7777
                    <br> 사업자 번호 : 145-51-00571
                    <br> 주소 : 강원도 원주시 우산동 상지대길 9 (402호)
                    <br> OWNER : 원에스핏 | WEB MANAGER : 이재원
                    <br> @ OSF ONESFIT
                </div>
            </div>
            </div>
                </div>
                

                <div id="rightmenu">
                    <ul>
                        <li><b>OPENING</b></li><br>
                        <li class="phone">T. 02-777-7777</li>                             
                        <li class="font10">MON-FRI / 11AM  - 5PM   </li> 
                        <li class="font10">lunch / 1AM -  2PM  </li> 
                        <li class="font10">(close, sat sun holiday)</li>
                    </ul>


                    <ul>

                    </ul>
                    <ul>
                        <li><b>BANK INFO</b></li><br>
                        <li>국민 5591-010-4168-906</li>                            
                        <li>ONESFIT (권성택) </li>
                    </ul>
                </div>
                
            </div>

        </div>
    </body>
</html>
