<%@ page language='java' contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


<style>
* {
   box-sizing: border-box
}

div {
   border: px solid black;
}

/*    모든 영역*/
#container {
   height: 1400px
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
   width: 1070px;
   height: 1400px;
   margin-left: 430px;
   margin-top: 45px;
   font-size: 11px;
}

#mainpic {
   width: 50%;
   height: 628px;
   float: left;
   padding: 30px;
}

#mainpic>img {
   width: 100%;
   height: 100%;
}

#maindetail {
   width: 50%;
   height: 628px;
   float: left;
   margin-bottom: 100px;
}

#reviewtable, #qnatable {
   border: 1px solid #dfdfdf;
   text-align: center;
   width: 1000px;
   position: relative;
   left: 40px;
}

#reviewtable_write, #qnatable_write {
   border: 1px solid #dfdfdf;
   text-align: center;
   width: 1000px;
   position: relative;
   left: 40px;
}

#reviewtable_update {
   border: 1px solid #dfdfdf;
}

#reviewtable th, #qnatable th {
   font-weight: normal;
   font-size: 12px;
}

#reviewtable tr td, #qnatable tr td {
   border: 1px solid #dfdfdf;
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

#Payment_Scheduled {
   float: left;
   width: 300px;
   width: 250px;
   position: fixed;
   right: 180px;
   top: 350px;
   font-size: 11px;
   color: gray;
}

#Payment_Scheduled input {
   color: #999
}

.amount {
   width: 30px;
   border: hidden;
}

#total {
   width: 80px;
   border: hidden;
   text-align: center;
}

.item {
   border-bottom: 1px solid #dfdfdf;
   border-top: 1px solid #dfdfdf;
   width: 200px;
   padding-bottom: 5px;
   padding-top: 5px;
   margin-top: 5px;
   text-align: center;
}

#totalPrice {
   border-bottom: 1px solid #dfdfdf;
   width: 200px;
   text-align: center;
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

/*부가 설명*/
#detail {
   margin-bottom: 30px;
}

/* 옵션 선택 */
select {
   width: 50%;
   padding: .8em .5em;
   font-family: inherit;
   background:
      url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
      no-repeat 95% 50%;
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   border-radius: 0px;
   margin-bottom: 5px;
   margin-top: 5px;
}

select::-ms-expand {
   /* for IE 11 */
   display: none;
}

/*   버튼*/
#buybtn {
   width: 30%;
   height: 50px;
   background-color: black;
   color: white;
   border: 0;
   border-radius: 5px;
}

#buybtn:hover {
   background-color: lightgray;
   color: black;
   transition-duration: 0.5s;
}

#cartbtn {
   width: 30%;
   height: 50px;
   background-color: whitesmoke;
   border: 0;
   border-radius: 5px;
}

#cartbtn:hover {
   background-color: lightgray;
   color: white;
   transition-duration: 0.5s;
}
/*    상세설명*/
#subdetailheader {
   text-align: center;
}

#subdetail {
   width: 100%;
}

#subpic {
   text-align: center;
}

#subpic>img {
   margin: auto;
   width: 100%;
}

#totalPrice {
   display: none;
}

.item>.del {
   border: 0;
}

#mainimage {
   display: block;
   width: 100%;
}

.magnifier {
   width: 150px;
   height: 150px;
   position: absolute;
   border-radius: 0;
   box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px
      rgba(0, 0, 0, 0.25);
   display: none;
}

input {
   border: 1px solid #dedede;
}

textarea {
   border: 1px solid #dedede;
}

.reviewDetail, .answerDetail {
   display: none;
}

.review:hover, .answer:hover {
   cursor: pointer;
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
               <a href="/"> <img src="/img/logo.png"
                  style="width: 130px; position: relative; left: 45px">
               </a>
               <div class="memberpage"> 
                            <ul>
                                <li>
                                <c:choose>
                                   <c:when test="${loginid eq 'pzlogin'}">
                                      <a href="/member/toLogin">login</a>
                                      <a href="/member/toSignup">join us</a>
                                </li>
                                   </c:when>
                                   <c:otherwise>
                                      <a href="/member/logout">logout</a> <a
                              href="/member/toProfile?id=${loginInfo}">PROFILE</a>
                                </li>
                                <li>
                                    <a href="/member/tomyPage">my page</a>
                                    <a href="/member/cart?parent_id=${loginid}">cart </a>
                                    <a href="">order</a>                                  
                                </li>
                                   </c:otherwise>
                                </c:choose>
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
                     <li><a href="" style="font-size: 11px;">OSF DAILY BOOK</a></li>

                  </ul>
               </div>

               <div>
                  <ul>
                     <li><a href=""><img src="/img/search.png"
                           style="width: 15px"></a> <input id="search" type="text">

                     </li>
                  </ul>
                  <ul>
                     <li><a href=""><img src="/img/instar.png"
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

         <div id="contents">
            <div id='mainpic'
               style="padding: 20px; margin: auto; text-align: center; width: 500px; height: 500px; position: relative; left: 42px;">
               <img src="/title/${pdto.title_img }"
                  style="width: 100%; height: 100%;" id='mainimage'>
            </div>
            <div id='maindetail'
               style="margin-top: 0px; margin-right: 0px; padding: 20px; height: 500px; color: #555555; position: relative; left: 70px; width: 480px;">
               <form action="payMent" method="post" name="payMent" id="frm">
                  <div style="font-size: 13px;">${pdto.pname }</div>
                  <div style="line-height: 50px; height: 210px; font-size: 13px;">
                     ${pdto.content }</div>
                  <div style="line-height: 50px; font-size: 13px;">
                     <b>PRICE</b> &nbsp; &nbsp; ${pdto.price }
                  </div>


                  <div id='option'>
                     <div>
                        <b>COLOR</b>&nbsp; &nbsp; <select id='color'
                           onchange="changeColor()" style="width: 50%">
                           <option>[필수] 옵션을 선택해주세요.</option>
                           <c:forEach var='i' items='${color }'>
                              <option>${i}</option>
                           </c:forEach>
                        </select>
                     </div>

                     <div>
                        <b>SIZE</b> &nbsp; &nbsp; &nbsp; &nbsp; <select id='size'
                           style="width: 50%" onchange="selectSize()">
                           <option>[필수] 색상을 선택해주세요.</option>
                        </select> <br> <br>
                     </div>

                  </div>
                  <br>
                  <div class="bcbtn">
                     <button class="btn btn-dark" id=buybtn type="submit"
                        class="btn btn-outline-secondary" value="BUY">BUY NOW</button>
                     &nbsp;&nbsp; <input type="button" value='CART' id='cartbtn'
                        style="font-size: 15px;"> <input type='hidden'
                        name='pseq' value="${pdto.pseq }">
                  </div>
                  <div id="Payment_Scheduled">
                     <div id="Payment"></div>
                     <br>
                     <div id='totalPrice'>
                        <b>total :</b>&nbsp;&nbsp;<input type='number' name='sum'
                           id='total' size='4' readonly style="border: hidden">KRW<br>
                     </div>
                  </div>
               </form>
            </div>
            <div id='subdetail'>
               <div id='subdetailheader'
                  style="position: relative; bottom: 100px; text-align: center;">
                  <div id='subpic' style="position: relative; left: 40px;">
                     <c:forEach var='i' items='${idto }'>
                        <div
                           style="width: 500px; height: 500px; float: left; padding: 20px">
                           <img src="/product/${pdto.pseq}/${i.sysname }" style="width: 100%;">
                        </div>
                     </c:forEach>
                  </div>
               </div>



               <input type='hidden' name='pseq' value="${pdto.pseq }">
               <table id="reviewtable"
                  style="position: relative; left: 40px; font-size: 11px">
                  <colgroup>
                     <col style="width: 15%">
                     <col style="width: 50%">
                     <col style="width: 15%">
                     <col style="width: 15%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th colspan="4"
                           style="border: hidden; border-bottom: 1px solid #dfdfdf; text-align: left;"><b>REVIEW</b><br>
                           상품의 사용후기를 적어주세요.<br> <br></th>
                     </tr>
                     <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col" style="border-right: 1px solid #dfdfdf">작성일</th>
                     </tr>



                     <c:choose>
                        <c:when test="${empty rdto}">
                           <tr>
                              <td colspan="6" align="center" style="height: 50px;">게시글이
                                 없습니다.</td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var='i' items='${rdto}'>
                              <form action="reviewupdate" method="post"
                                 enctype="multipart/form-data">
                                 <input type='hidden' name='pseq' value="${pdto.pseq }">
                                 <tr class='review' style="height: 30; padding: 15px;">
                                    <td style="border-right: hidden">${i.bno }<input
                                       type="text" style="display: none" name=bno
                                       value="${i.bno }">
                                    </td>
                                    <c:choose>
                                       <c:when test="${empty i.img }">
                                          <td style="border-right: hidden">${i.title }</td>
                                       </c:when>
                                       <c:otherwise>
                                          <td style="border-right: hidden">${i.title }&nbsp;<img
                                             src="/img/icon.png"></td>
                                       </c:otherwise>
                                    </c:choose>
                                    <td style="border-right: hidden">${i.writer }<input
                                       type="text" style="display: none" name=writer
                                       value="${i.writer }">
                                    </td>
                                    <td>${i.write_date }</td>
                                 </tr>

                                 <tr style="height: 200px;" class='reviewDetail'>
                                    <td style="border-right: hidden; padding: 15px;" colspan='1'><c:choose>
                                          <c:when test="${!empty i.img }">
                                             <img src="/product/${i.pseq}/review/${i.img }"
                                                style="width: 200px; height: 200px;">
                                             <input type="text" style="display: none"
                                                value="${i.img }" name="reviewimg">
                                          </c:when>
                                       </c:choose></td>
                                    <td colspan='3'
                                       style="vertical-align: top; text-align: left; padding: 15px;">
                                       ${i.content } <c:choose>
                                          <c:when test="${loginInfo.id eq i.writer}">
                                             <div style="text-align: right; margin-top: 180px;">
                                                <input type="button" value="수정"
                                                   style="background-color: white;" class="reviewupdate">
                                                <input type="button" value="삭제"
                                                   style="background-color: white;"
                                                   onclick="reviewdelete(${i.bno})">
                                             </div>
                                          </c:when>
                                       </c:choose>
                                    </td>
                                 </tr>
                                 <tr style="height: 200px; display: none"
                                    class='review_Write_Update'>
                                    <td colspan='4' style="vertical-align: top; padding: 10px;">
                                       <input type="text" name=title
                                       style="width: 50%; position: relative; right: 245px; top: 5px;"
                                       value="${i.title }"> <br> <br> <textarea
                                          name="content"
                                          style="width: 100%; height: 170px; font-size: 11px;">${i.content }</textarea>
                                       <div style="width: 100px; font-size: 11px;">
                                          <input type="file" name="file" id="profile_pt"
                                             onchange="previewImage(this,'View_area')"
                                             style="display: block;" /> <input type=text
                                             value="* 이미지를 변경하려면 파일을 선택하세요."
                                             style="width: 500px; border: hidden; outline: none;"
                                             readonly="readonly"> <input type="submit"
                                             value="수정하기 "
                                             style="background-color: white; display: block; position: relative; left: 915px; text-align: center;"
                                             id="reviewupdate">
                                       </div>
                                    </td>
                              </form>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>



                     <tr
                        style="border-left: hidden; border-right: hidden; height: 50px;">
                        <td colspan="6" style="text-align: right; border-bottom: hidden"><input
                           type="button" value="제품후기작성 " style="background-color: white;"
                           id="reviewbtn1"></td>
                     </tr>
                  </thead>
               </table>


               <form action="review" method="post" enctype="multipart/form-data">
                  <input type='hidden' name='pseq' value="${pdto.pseq }">
                  <table id="reviewtable_write" style="display: none;">
                     <colgroup>
                        <col style="width: 80px">
                        <col style="width: 100%">
                     </colgroup>
                     <tr style="border-top: hidden;">
                        <td style="height: 35px; font-size: 12px;">&nbsp;&nbsp;제목</td>
                        <td style="text-align: left;">&nbsp;&nbsp;<input
                           name="title" type="text" style="width: 50%; height: 20px;"></td>
                     </tr>
                     <tr>
                        <td colspan="6"><textarea name="content"
                              style="width: 100%; height: 250px; font-size: 12px;">키 - / 몸무게

- 구매하신 사이즈와 색상 

- 상품 후기 - (20자 이상으로 작성해 주시기 바랍니다.)
                                            </textarea></td>
                     </tr>
                     <tr>
                        <td colspan="6">
                           <div style="width: 100px; font-size: 11px;">
                              <input type="file" name="file" id="profile_pt"
                                 onchange="previewImage(this,'View_area')"
                                 style="display: block;" />
                           </div>
                        </td>
                     </tr>
                     <tr style="border: hidden; border-top: 1px">
                        <td colspan="6" style="text-align: right"><input
                           type="submit" value="제품후기작성 "
                           style="background-color: white; font-size: 12px;"
                           id="reviewbtn2"></td>
                     </tr>

                  </table>
               </form>


               <table id="qnatable"
                  style="position: relative; left: 40px; font-size: 11px">
                  <colgroup>
                     <col style="width: 15%">
                     <col style="width: 50%">
                     <col style="width: 15%">
                     <col style="width: 15%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th colspan="6"
                           style="border: hidden; border-bottom: 1px solid #dfdfdf; text-align: left;"><b>
                              Q&A</b><br>상품에 대해 궁금한 점을 해결해 드립니다.<br> <br></th>
                     </tr>
                     <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col" style="border-right: 1px solid #dfdfdf;">작성일</th>
                     </tr>


                     <c:choose>
                        <c:when test="${empty qdto}">
                           <tr>
                              <td colspan="6" align="center" style="height: 50px;">게시글이
                                 없습니다.</td>
                           </tr>
                        </c:when>

                        <c:otherwise>
                           <c:forEach var='i' items='${qdto}'>
                              <c:choose>
                                 <c:when test="${loginInfo.id eq i.writer}">
                                    <tr class="answer" style="height: 30px; padding: 10px;">
                                       <td style="border-right: hidden">${i.bno }</td>
                                       <td style="border-right: hidden">${i.title }</td>
                                       <td style="border-right: hidden">${i.writer }</td>
                                       <td>${i.write_date }</td>
                                    </tr>
                                 </c:when>
                                 <c:otherwise>
                                    <tr class="answer answer2" style="height: 30px; padding: 10px;"
                                       onclick="return false">
                                       <td style="border-right: hidden">${i.bno }</td>
                                       <td style="border-right: hidden">상문 문의 드립니다. &nbsp;<img src="/img/lock.png" style="position: relative; bottom: 2px;"></td>
                                       <td style="border-right: hidden">${i.writer }</td>
                                       <td>${i.write_date }</td>
                                    </tr>
                                 </c:otherwise>
                              </c:choose>

                              <tr style="height: 200px; border-top: 1px solid black;"
                                 class='answerDetail'>
                                 <td colspan='4'
                                    style="vertical-align: top; text-align: left; padding: 15px;">
                                    <div style="height: 100px;">${i.content }</div>


                                    <div style="height: 80px; display: none;">
                                       <p
                                          style="border-top: 1px solid #dfdfdf; border-bottom: 1px solid #dfdfdf; padding: 5px">
                                          <b>원에스핏 (ONESFIT)</b>
                                       </p>
                                       <div class="OSF_qanswer"></div>
                                    </div> <c:choose>
                                       <c:when test="${loginInfo.id eq i.writer}">
                                          <div style="text-align: right; margin-top: 50px;">
                                             <input type="button" value="삭제"
                                                style="background-color: white;"
                                                onclick="questiondelete(${i.bno})">
                                          </div>
                                       </c:when>
                                    </c:choose>
                              </tr>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>

                     <tr
                        style="border-left: hidden; border-right: hidden; height: 50px;">
                        <td colspan="6" style="text-align: right; border-bottom: hidden">
                           <input type="button" value="상품문의하기 "
                           style="background-color: white;" id="qnabtn1">
                        </td>
                     </tr>
                  </thead>
               </table>

               <form action="question" method="post">
                  <input type='hidden' name='pseq' value="${pdto.pseq }">
                  <table id="qnatable_write" style="display: none;">
                     <colgroup>
                        <col style="width: 80px">
                        <col style="width: 100%">
                     </colgroup>
                     <tr style="border-top: hidden;">
                        <td style="height: 35px; font-size: 12px;">&nbsp;&nbsp;제목</td>
                        <td style="text-align: left;">&nbsp;&nbsp;<input
                           name="title" type="text" style="width: 50%; height: 20px;"></td>
                     </tr>
                     <tr>
                        <td colspan="6"><textarea name="content"
                              style="width: 100%; height: 250px; font-size: 12px;"></textarea></td>
                     </tr>
                     <tr style="border: hidden; border-top: 1px">
                        <td colspan="6" style="text-align: right"><input
                           type="submit" value="상품문의하기 "
                           style="background-color: white; font-size: 12px;" id="qnabtn2"></td>
                     </tr>

                  </table>
               </form>


               <div class="footer"
                  style="float: left; width: 1068px; margin-top: 50px;">
                  <a href="">사이트 소개</a> | <a href="">이용약관</a> | <a href="">개인정보취급방침</a>
                  | <a href="">이메일 무단수집거부</a> | <a href="">책임의 한계와 법적고지</a> | <a
                     href="">이용안내</a> | <a href="">모바일 버전</a> <br> <br>
                  <div>
                     COMPANY : ONESFIT <br> PHONE : 010-7777-7777 <br> 사업자
                     번호 : 145-51-00571 <br> 주소 : 강원도 원주시 우산동 상지대길 9 (402호) <br>
                     OWNER : 원에스핏 | WEB MANAGER : 잊재웡 <br> @ OSF ONESFIT

                  </div>
               </div>
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

      <input type='hidden' value='${loginId }' id='loginId'> <input
         type='hidden' value='${pdto.pseq }' id='pseq'>
   </div>
   <script>
                    $("#cartbtn")
                        .on(
                        "click",
                        function() {
                            /* var option1 = $("#size option").index(
                                $("#size option:selected"));
                            var option2 = $("#color option").index(
                                $("#color option:selected")); */
                            var size = $.map($('.picksize'), function (el) { return el.value; });
                            var color = $.map($('.pickcolor'), function (el) { return el.value; });
                            var amount = $.map($('.amount'), function (el) { return el.value; });   
                            var length = $(".pickoption").length;
                            if(length !=0){
                                $
                                    .ajax(
                                    {
                                        url : "cartAdd",
                                        dataType : "Json",
                                        data : {                                                   
                                            pseq : $("#pseq").val(),
                                            option1 : JSON.stringify(size),
                                            option2 : JSON.stringify(color),
                                            amounts : JSON.stringify(amount),
                                            length :length
                                        }
                                    })
                                    .done(
                                    function(resp) {
                                        if (resp.result > 0) {
                                           $(".item").remove();
                                           $("#total").val("0");
                                           $("#totalPrice").css("display","none");
                                            var check = confirm("장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?");
                                            if (check) {
                                                location.href = "#";
                                            }
                                        } else {
                                            alert("알수 없는 오류로 장바구니에 담기지 않았습니다.");
                                        }
                                    })
                            }else{
                               alert("옵션을 선택해주세요.");
                            }                           
                        })
                        
                        $("#frm").on("submit",function(){
                            var length = $(".pickoption").length;
                            if(length==0){
                               alert("옵션을 선택해주세요.");
                               return false;
                            }
                        })
                </script>
   <script> 
                        function changeColor() {
                            $(".sizeoption").remove();
                            if ($("#color option").index($("#color option:selected")) != 0) {            
                                $.ajax({
                                    url : "colorSelect",
                                    data : {
                                        pseq : $("#pseq").val(),
                                        color : $("#color option:selected").val()
                                    }
                                }).done(
                                    function(resp) {
                                        var optionLen = resp.length;                     
                                        for (var i = 0; i < optionLen; i++) {
                                            if(resp[i].item_count>0){
                                                $("#size").append(
                                                    "<option class='sizeoption'>" + resp[i].psize + "</option>");
                                            }else{
                                                $("#size").append(
                                                    "<option class='sizeoption' disabled>" + resp[i].psize + "[품절]</option>");
                                            }
                                        }
                                    })
                            }          
                        }
                        
                        function selectSize(){
                           var color =$("#color option:selected").val();
                           var size = $("#size option:selected").val();
                           var total = $("#total").val();
                           var length = $(".pickoption").length;
                           var arr = $.map($('.pickoption'), function (el) { return el.value; });
                           
                           if($("#size option").index($("#size option:selected"))!=0){
                              for(var i=0;i<length;i++){                                 
                                 if((color+size)==arr[i]){
                                    alert("이미 선택된 옵션입니다.");
                                    $("#color option:eq(0)").prop("selected",true);
                                      $("#size option:eq(0)").prop("selected",true);
                                      $(".sizeoption").remove();
                                    return false;
                                 }
                              }                              
                              $("#Payment").append(
                                      "<div class='item'><b>${pdto.pname}</b>&nbsp; &nbsp; &nbsp;<input type='hidden' class='pickoption' value='"+color+size+"'><input type='hidden' class='pickcolor' name='color' value='"+color+"'><input type='hidden' class='picksize' name='size' value='"+size+"'> <input type='number' name='amount' class='amount' value='1' size='1'min='1' onchange='change();'>"+
                                      "-"+color+"/"+size+"&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' class='del' value='x'></div>");
                              $("#total").val(Number(total)+Number(${pdto.price}));  
                              $("#color option:eq(0)").prop("selected",true);
                              $("#size option:eq(0)").prop("selected",true);
                              $(".sizeoption").remove();
                              $("#totalPrice").css("display","block");
                           }
                        }                       
            
                    </script>
   <script>
                       function change(){
                          var amount=0;
                          var total = $("#total").val();
                          $(".amount").each(function(){
                             amount +=Number($(this).val());                             
                          })
                          if(amount!=0){
                             $("#total").val(amount*${pdto.price});
                          }else{
                             $("#total").val(0);
                              $("#totalPrice").css("display","none");
                          }
                       }      
                       $(document).on("click",".del",function(){
                          $(this).parent("div").remove();
                          return change();
                       })
                        var review = document.getElementById("review");

                        $("#reviewbtn1").on("click",function() {
                            $("#reviewtable_write").css("display","block");
                            $("#reviewbtn1").css("display","none");
                        })
                        
                         $("#qnabtn1").on("click",function() {
                            $("#qnatable_write").css("display","block");
                            $("#qnabtn1").css("display","none");
                        })

                        
                       function previewImage(targetObj, View_area) {
                var preview = document.getElementById(View_area); //div id
                var ua = window.navigator.userAgent;

                //ie일때(IE8 이하에서만 작동)
                if (ua.indexOf("MSIE") > -1) {
                    targetObj.select();
                    try {
                        var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
                        var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


                        if (ie_preview_error) {
                            preview.removeChild(ie_preview_error); //error가 있으면 delete
                        }

                        var img = document.getElementById(View_area); //이미지가 뿌려질 곳

                        //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                        img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
                    } catch (e) {
                        if (!document.getElementById("ie_preview_error_" + View_area)) {
                            var info = document.createElement("<p>");
                            info.id = "ie_preview_error_" + View_area;
                            info.innerHTML = e.name;
                            preview.insertBefore(info, null);
                        }
                    }
                    //ie가 아닐때(크롬, 사파리, FF)
                } else {
                    var files = targetObj.files;
                    for ( var i = 0; i < files.length; i++) {
                        var file = files[i];
                        var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                        if (!file.type.match(imageType))
                            continue;
                        var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
                        if (prevImg) {
                            preview.removeChild(prevImg);
                        }
                        var img = document.createElement("img"); 
                        img.id = "prev_" + View_area;
                        img.classList.add("obj");
                        img.file = file;
                        img.style.width = '200px';
                        img.style.height = '200px';
                        $("#View_area").html("");
                        img.setAttribute('onclick','document.all.file.click();');
                        preview.prepend(img);
                        $("#View_area").css("border","none");
                        if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                            var reader = new FileReader();
                            reader.onloadend = (function(aImg) {
                                return function(e) {
                                    aImg.src = e.target.result;
                                };
                            })(img);
                            reader.readAsDataURL(file);
                        } else { // safari is not supported FileReader
                            //alert('not supported FileReader');
                            if (!document.getElementById("sfr_preview_error_"
                                                         + View_area)) {
                                var info = document.createElement("p");
                                info.id = "sfr_preview_error_" + View_area;
                                info.innerHTML = "not supported FileReader";
                                preview.insertBefore(info, null);
                            }
                        }
                    }
                }
            }
                     $("#mainpic")
                        .on('mousemove', magnify)
                        .prepend("<div class='magnifier'></div>")
                        .children('.magnifier').css({
                            "background": "url('" + $("#mainimage").attr("src") + "') no-repeat"
                        });
                     
                    var target = $('#mainimage');
                    var magnifier = $('.magnifier');
                    function magnify(e) {
                        
                        // 1
                        var mouseX = e.pageX - $(this).offset().left;
                        var mouseY = e.pageY - $(this).offset().top;
                     
                        // 2
                        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
                            magnifier.fadeIn(100);
                        } else {
                            magnifier.fadeOut(100);
                        }
                     
                        // 3
                        if (magnifier.is(":visible")) {
                     
                            // 4    
                            var rx = -(mouseX / target.width() * target[0].naturalWidth - magnifier.width() / 2);
                            var ry = -(mouseY / target.height() * target[0].naturalHeight - magnifier.height()  /2);
                     
                            // 5
                            var px = mouseX - magnifier.width() / 2;
                            var py = mouseY - magnifier.height() / 2;
                     
                            // 6
                            magnifier.css({
                                left: px,
                                top: py,
                                backgroundPosition: rx + "px " + ry + "px"
                            });
                        }
                    }
                    
                   $(".review").on("click",function(){
                       $(this).next().toggle();
                    })                  
                       
                    $(".answer").on("click",function(){
                             $(this).next().toggle();
                          })  
                          
                          $(".answer2").on("click",function(){
                             $(this).next().hide();
                          })  
  

                    function reviewdelete(value) {
                      var check = confirm("게시글을 삭제 하시겠습니까?");
                      if(check){
                       location.href="reviewdelete?bno="+value+"&&pseq="+$('#pseq').val();
                      }
                    }
                   
                   function questiondelete(value) {
                       var check = confirm("게시글을 삭제 하시겠습니까?");
                       if(check){
                        location.href="questiondelete?bno="+value+"&&pseq="+$('#pseq').val();
                       }
                     }
                   
                   
                   
                   $(document).on("click",".reviewupdate",function(){
                      var check = confirm("게시글을 수정 하시겠습니까?");
                       if(check){  
                          $(this).closest("tr").next().css("display","table-row");
                             $(".reviewDetail").css("display","none");
                            $("#reviewbtn1").css("display","none");
                            $("#reviewupdate").css("display","block");
                       }
                      
                   }) 

                 
                    </script>
</body>
</html>