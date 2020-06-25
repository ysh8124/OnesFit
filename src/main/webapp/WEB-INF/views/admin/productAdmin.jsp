<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
         <style>
        *{box-sizing: border-box}
        div{border:1px solid black}

        table{border: 1px solid #d3d8e1}
        table tr td{border: 1px solid #d3d8e1}

        /*    모든 영역*/
        #container{height: 1000px;}

        /*    왼쪽 메뉴*/
        #sidemenu{float: left; width: 287px;  padding: 180px 0 10px 50px;}
        #sidefix ul{list-style: none;}
        #sidefix ul li a{text-decoration: none; 
            color: black; 
            position: relative;
            display: inline-block;
            margin: 0px 15px 5px 0;
            color: #000;
            font-size: 11px;
            letter-spacing: 0;
            text-transform: uppercase;    
        }
        table tr img{width: 120px; height: 150px;}


        /*    중앙 내용*/
        #contents{width: 1598px; height: 900px; margin-left: 287px;
            padding : 100px}
        
        #point{width: 100px;}
        
        table a{text-decoration: none; color: black;
        }
        
    </style>
    <script>
    	$(function(){
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
                <div id="sidemenu">

                    <div id="sidefix">
                        <h1 style="text-align: center">
                            Manager
                            <a href="">
                                <img src="">
                            </a>
                        </h1>

                        <div id="category">
                            <div class="position">
                                <ul class="m-category">
                                    <li><a href="">Member</a></li>
                                    <li><a href="">product</a></li>
                                    <li><a href="">Qna</a></li>
                                    <li><a href="">cody</a></li>
                                    <li><a href="">order</a></li>
                                    <li><a href="">notice</a></li>
                                    <li><a href="">popup</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

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
                        
                        <!-- choose문 들어갈 자리 -->
                        <tr align=center>

                            <td align=center>1</td>

                            <td class="text" align=left><a href="#">미니멀 반팔가디건</a>
                            </td>
                            <td class="text" align=center>상품가격</td>
                            <td class="text">등록일자</td>
                            <td class="text" align=center>상품분류</td>
                            <td align=center class="text">N</td>
                            <td class="text"><a href="product/toModify.proc">수정</a><a href="product/productDelete.proc?${pseq}" style="margin-left: 20px;">삭제</a></td>  
                        </tr>
                        <!-- 출력문 끝나고 지워야함 -->
                        
                    </table>
                    <div style="width:1268px;"><button id="add" style="margin-left: 1100px">상품등록</button></div>
                    
                </div>

            </div>
            <div id="footer">FOOTER</div> 

        </div>
    </body>
</html>