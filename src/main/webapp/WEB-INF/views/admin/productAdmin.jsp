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

#shipping_info{border: 1px solid #dfdfdf; width: 800px; font-size: 11px;}
            #shipping_info td{padding: 10px}
            #shipping_info th{text-align: center; height: 50px;}

        table{border: 1px solid #d3d8e1}
        table tr td{border: 1px solid #d3d8e1}

        /*    모든 영역*/
        #container{height: 1000px;}


        table tr img{width: 120px; height: 150px;}


        /*    중앙 내용*/
        #contents{width: 1598px; height: 900px; margin-left: 287px;
            padding : 100px}
        
        #point{width: 100px;}
        
        table a{text-decoration: none; color: black;
        }
        
    </style>
    <script>
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    
    	$(function(){
    		$(".del").on("click",function(){
    			if(confirm("정말 삭제하시겠습니까?")){return true;
    			}else{
    			return false;
    			}
    		})
    		
    		$(".price").each(function(index,item){
    			var num = $(item).html();
    			var num2 = numberWithCommas(num);
    			$(item).html(num2);
    		})
    		
    		$("#add").on("click",function(){
    		location.href="../admin/productAdd";
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
                        <li> <a href="/admin/productAdmin"> 상품 관리 </a></li>
                        <li> <a href="/admin/buyList"> 주문 관리 </a></li>
                        <li><a href="/admin/memberAdmin">회원 관리</a></li>
                        <li><a href="/admin/question">Q&A 관리</a></li>
                        <li><a href="">DAILY 게시판</a></li>
                        <li><a href="/admin/notice">공지사항 </a></li>    
                        <li><a href="">팝업 관리</a></li>  
                        <li><a href=""><i class="fa fa-fw fa fa-question-circle"></i> 판매자 정보</a></li>
                    </ul>
                </div>
            </nav>

                <div id="contents">
                    <div style="width:100%">
                        <b>Product Management</b> 
                       
                            <select style="position: relative; top: 3px; margin-left: 810px;">
                                <option>상품번호</option>
                                <option>상품명</option>
                                <option>상품분류</option>
                            </select> 
                            <input id="search" type="text">     
                            <a href="">
                                <img src="../resources/img/search.png" style="width: 18px; position: relative; top: 4px"></a>
                     
                    </div>

                    <br>

                    <table>   
                        <tr align=center>
                            <td style="width:50px">상품번호</td>

                            <td style="width:300px">상품명</td>
                            <td style="width:100px">상품가격</td>
                            <td style="width:300px">등록일자</td>
                            <td style="width:200px">상품분류</td>
                            <td style="width: 100px">품절</td>
                            <td style="width: 200px">비고</td>    
                        </tr>
                        
                        <!-- choose -->
                        <c:choose>
                        	<c:when test="${!empty pdto}">
                        		<c:forEach var="p" items="${pdto}">
                        			<tr align=center>
                            <td align=center>${p.pseq }</td>
                            <td class="text" align=left><a href="#">${p.pname }</a>
                            </td>
          					
                            <td class="text price" align=center>${p.price}</td>
                     
                            <td class="text">${p.regist_date }</td>
                            <td class="text" align=center>${p.category}</td>
                            <td align=center class="text">${p.soldout_yn}</td>
                            <td class="text"><a href="/admin/productModify?pseq=${p.pseq}">수정</a><a href="/admin/productDelete?pseq=${p.pseq}" class=del style="margin-left: 20px;">삭제</a></td>  
                        </tr>
                        		</c:forEach>
                        		</c:when>
                        		<c:otherwise>
                        			<tr><td align=center colspan=7>상품이 없습니다.</tr>
                        		</c:otherwise>
                        </c:choose>
                     
                        
                    </table>
                    <div style="width:1268px;"><button id="add" style="margin-left: 1100px">상품등록</button></div>
                    
                </div>

            </div>
            <div id="footer">FOOTER</div> 

        </div>
    </body>
</html>