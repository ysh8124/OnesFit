<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
    
     <style>
       
 @import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
            *{box-sizing: border-box;}
    
            .side-nav {
                position: fixed;
                top: 64px;
                left: 225px;
                width: 225px;
                margin-left: -225px;
                border: none;
                border-radius: 0;
                overflow-y: auto;
                background-color: black;
                bottom: 0;

            }

            .side-nav>li>a {
                width: 225px;
                border-bottom: 1px rgba(0,0,0,.3) solid;
            }

            .side-nav li a:hover,
            .side-nav li a:focus {
                outline: none;
                background-color: dimgrey;
            }
            
            .side-nav li a {
                color: white;
            }

	table{border: 1px solid #d3d8e1}
        table tr td{border: 1px solid #d3d8e1}

        
        tr td a{text-decoration: none; color:grey;}

        /*    모든 영역*/
        #container{height: 1000px;}


        

        /*    중앙 내용*/
        #contents{width: 1598px; height: 900px; margin-left: 287px;
            padding : 100px}
        #point{width: 100px;}

    </style>
    
    <script>
    $(function(){
    	$(".point").keydown(function(key) {

    		if (key.keyCode == 13) {    
                    $.ajax(
                                {
                                   url : "/admin/updatePoint",
                                   dataType : "Json",
                                   data : {
                                      id : $(this).closest("tr").children(":first").html(),
                                      point : $(this).val()
                                   }
                                })
                          .done(
                                function(resp) {
                                   if (resp > 0) {
                                      alert("포인트 수정 완료.");
                                   }
                                })
                 }
              })
    	
    	$(".del").on("click",function(){
    		if(!confirm("정말 삭제하시겠습니까?")){ return false;}
    	})
    	$(".black").on("click",function(){
    		if(!confirm("블랙리스트에 추가하시겠습니까?")){return false;}
    	})
    })
    	

    </script>
    </head>
    <body>
        <!--       전체 영역-->
        <div id=OSF_ALL>
            <!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
            <div id="container">

                <!--               사이드메뉴-->
                 <nav class="navbar navbar-inverse navbar-fixed-top">
                <div style="color: white; margin-left: 18px;"><h2>ADMIN</h2></div>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div>
                    <ul class="nav side-nav">
                        <li><a href="#"><i class="fa fa-fw fa-star"></i> DASH BOARD</a></li>  
                        <li> <a href="#"> 상품 관리 </a></li>
                        <li> <a href="#"> 주문 관리 </a></li>
                        <li><a href="">회원 관리</a></li>
                        <li><a href="">Q&A 관리</a></li>
                        <li><a href="">DAILY 게시판</a></li>
                        <li><a href="">공지사항 </a></li>    
                        <li><a href="">팝업 관리</a></li>  
                        <li><a href=""><i class="fa fa-fw fa fa-question-circle"></i> 판매자 정보</a></li>
                    </ul>
                </div>
            </nav>


                    <div id="contents">
                    <div style="width:100%">
                              <b>Member Management</b>    
                              <select style="margin-left: 900px;">
                                 <option>아이디</option>
                                 <option>이름</option>
                                 <option>별명</option>
                                 </select>   
                               <input id="search" type="text">     
                                <a href=""><img src="../resources/img/search.png" style="width: 17px"></a>
                    </div>   
                                   
                    <table>   
                        <tr align=center>
                            <td style="width:100px">아이디</td>
                            <td style="width:100px">이름</td>
                            <td style="width:300px">주소</td>
                            <td style="width:150px">핸드폰</td>
                            <td style="width:200px">이메일</td>
                            <td style="width: 150px">가입일자</td>
                            <td style="width: 150px">최근접속</td>
                            <td style="width: 80px">포인트</td>
                            <td style="width: 50px;font-size: 12px">블랙<br>리스트</td>
                            <td style="width: 140px">비고</td>
                        </tr>
                        <c:choose>
                        <c:when test="${!empty mdto }">
                        	<c:forEach var="m" items="${mdto}">
                        <tr>
                            <td class=id>${m.id }</td>
                            <td>${m.name }</td>
                            <td>${m.address1 } <br> ${m.address2 }</td>
                            <td>${m.phone }</td>
                            <td>${m.email }</td>
                            <td>${m.regist_date }</td>
                            <td>${m.sDate}</td>         
                            <td><input type="text" class="point" value="${m.point }" style="width:80px"></td>
                            <td align=center>${m.blacklist_yn }</td>
                            <td><a href="/admin/memberDelete?id=${m.id}" class=del>삭제</a>
                            <a href="/admin/memberBlack?id=${m.id}" class=black>블랙</a>
                            </td>
                        </tr>
                        	</c:forEach>
                        </c:when>
                        <c:otherwise>
                        <td colspan=10 align=center>회원이 없습니다.
                        </c:otherwise>
                        </c:choose>                 
                    </table>
                </div>
            </div>
            <div id="footer">FOOTER</div> 

        </div>
    </body>
</html>