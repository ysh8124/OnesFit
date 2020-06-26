<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
</style>
</head>
<body>
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
</body>
</html>