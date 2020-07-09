<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
</head>
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
   /* height: 800px */
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
   /* width: 1212px;
   height: 524px; */
   /* margin-left: 340px; */
   font-size: 11px;
   text-align: center;
  /*  margin-top: 51px; */
}

#contents li {
   list-style: none;
}

#addresstable {
   border: 1px solid #dfdfdf;
   text-align: center;
   width: 1000px;
}

#addresstable tr td {
   border: 1px solid #dfdfdf;
}

#help_tb {
   border: 1px solid #dfdfdf;
   width: 1000px;
   height: 80px;
   text-align: left;
}

#help_tb th {
   border-bottom: 1px solid #dfdfdf;
   background: #F6F6F6
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
         

         <!--               중앙 내용-->
         <div id="contents">
            <div>
               <h2 style="font-size: 14px; text-align: center; line-height: 30px">
                  <b>ADDRESS BOOK</b>
                  <div style="font-size: 12px; color: #939393;">자주 쓰는 배송지를 등록
                     관리하실 수 있습니다.</div>
               </h2>
            </div>
            <br> <br>
            
            <div style="padding-left: 100px;">
               <table id="addresstable" style="margin-bottom: 90px">
                  <colgroup>
                     <col style="width: 30px">
                     <col style="width: 80px">
                     <col style="width: 80px">
                     <col style="width: 100px">
                     <col style="width: 300px">
                     <col style="width: 70px">
                  </colgroup>

                  <thead>
                     <tr style="height: 40px">
                        <th scope="col"></th>
                        <th scope="col">배송지명</th>
                        <th scope="col">수령인</th>
                        <th scope="col">휴대전화</th>
                        <th scope="col">주소</th>
                        <th scope="col" style="border-right: 1px solid #dfdfdf">선택</th>
                     </tr>
                  </thead>


                  <tbody>

                     <c:choose>
                        <c:when test="${empty list}">
                           <tr align=center>
                              <td colspan="6">추가하신 배송목록이 없습니다.
                           </tr>
                        </c:when>

                        <c:otherwise>
                           <c:forEach var="i" items="${list}">

                              <tr style="height: 40px;">
                                 <td>${ i.seq}</td>
                                 <td>${ i.homename}</td>
                                 <td id="takename">${ i.takename}</td>
                                 <td>${ i.phone}</td>
                                 <td>${i.zipcode},${i.address1},${i.address2}</td>      
                                 <td><input type="radio" name="address" class='select'></td>                          
                              </tr>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
                    <%--  <tr>
                        <td colspan="6" align=center>${navi}</td>
                     </tr>
 --%>
                     <tr>
                        <td colspan="6"
                           style="text-align: right; border: hidden; border-top: 1px; height: 80px">   
                           <input type='button' value='적용' id='input'>                       
                        </td>
                     </tr>
                  </tbody>
               </table>



               <table id="help_tb">
                  <colgroup>
                     <col style="width: 33.33%">
                     <col style="width: 33.33%">
                     <col style="width: 33.33%">
                  </colgroup>
                  <thead>
                     <tr style="height: 30px;">
                        <th>
                           <div style="position: relative; left: 10px;">
                              <strong style="font-size: 12px;">배송주소록 유의사항</strong>
                           </div>
                        </th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>
                           <div style="text-align: left;">
                              <ul style="list-style: none; color: #999; margin-top: 10px">
                                 <li>- 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송
                                    주소록 기준으로 자동 업데이트 됩니다.</li>
                                 <li>- 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트
                                    대상에서 제외됩니다.</li>
                                 <li>- 기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가
                                    변경됩니다.</li>
                              </ul>
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      <br>
   </div>
   <script>
   		$("#input").on("click",function(){
   			$(".select").each(function(){
   				if($(this).is(":checked")){
   					var takename=$(this).closest("tr").children().eq(2).text();
   					var phone =$(this).closest("tr").children().eq(3).text();
   					var address = $(this).closest("tr").children().eq(4).text();
   					var add = address.split(",");
   					$(".recipient",opener.document).val(takename);
   					$(".phone",opener.document).val(phone);
   					$("#zipcode",opener.document).val(add[0]);
   					$("#add1",opener.document).val(add[1]);
   					$("#add2",opener.document).val(add[2]);
   					window.close();
   				}
   			})
   		})
   </script>
  
</body>
</html>
