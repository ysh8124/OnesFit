<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="/img/onesfitcon.png">
<meta charset="UTF-8">
<title>Admin popupInsertPage</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>


<style>
@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css')
	;

* {
	box-sizing: border-box;
}

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
	border-bottom: 1px rgba(0, 0, 0, .3) solid;
}

.side-nav li a:hover, .side-nav li a:focus {
	outline: none;
	background-color: dimgrey;
}

.side-nav li a {
	color: white;
}

#product_contents {
	position: relative;
	top: 120px;
	left: 350px;
	width: 1500px
}

#radio {
	position: relative;
	top: 3px;
}

.container {
	width: 1200px;
	height: 900px;
	margin-left: 307px;
	padding: 20px;
	font-size: 12px;
}

#product_box {
	background-color: #f6f6f6;
	border: 1px solid #eeeeee;
}

.img_notice {
	color: forestgreen;
}

#img_title {
	background-color: #f6f6f6;
}

.xbox {
	border: 1px dashed black;
	width: 200px;
	height: 200%;
}

#submit {
	width: 100px;
	height: 30px;
	border: 1px solid #c4c4c4;
	background-color: rgba(266, 266, 266, 0);
	color: #c4c4c4;
}

#contents li {
	list-style: none;
}

#qnatable {
	border: 1px solid #dfdfdf;
	text-align: center;
	width: 1300px;
	font-size: 12px;
}

#qnatable  th {
	text-align: center;
}

#qnatable tr td {
	border: 1px solid #dfdfdf;
}

#qnadiv {
	padding-left: 400px;
}

#qnadiv table td a {
	list-style: none;
	color: black;
}

/* 댓글 */
.chatBox {
	overflow-y: auto;
	word-wrap: break-word;
}

.editor {
	border: 1px solid #c4c4c4;
	background-color: rgba(266, 266, 266, 0);
	overflow: auto;
}

.hButton:hover {
	background-color: gray;
}

/* 검색 */
#selectBox {
	border: 1px solid #dfdfdf;
}

#search {
	border: 1px solid #dfdfdf;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
				<div style="color: white; margin-left: 18px;">
					<h2>ADMIN</h2>
				</div>
				<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
				<div>
					<ul class="nav side-nav">
						<li><a href="/admin/adminMain"><i
								class="fa fa-fw fa-star"></i> DASH BOARD</a></li>
						<li><a href="/">메인으로</a></li>
						<li><a href="/admin/productAdmin"> 상품 관리 </a></li>
						<li><a href="/admin/buyList"> 주문 관리 </a></li>
						<li><a href="/admin/memberAdmin">회원 관리</a></li>
						<li><a href="/admin/question">Q&A 관리</a></li>
						<li><a href="/daily/daily_list">DAILY 게시판</a></li>
						<li><a href="/notice/notice_list?page=1">공지사항 </a></li>
						<li><a href="/admin/popup">팝업 관리</a></li>
						<li><a href=""><i class="fa fa-fw fa fa-question-circle"></i>
								판매자 정보</a></li>
					</ul>
				</div>
			</nav>


	<div style="margin-top: 60px;">
		<h2 style="font-size: 14px; text-align: center; margin-top: 100px;">
			<b>Pupup BOARD</b>
		</h2>
	</div>
	<br>
	<br>

	<div id="qnadiv" style="max-height: 1000px">
		<form action="popupInput" method="post" enctype="multipart/form-data">
			<input type='text' name="title" id="title" style="width: 200px">
			<input type="file" name="file" id="file"> <input
				type="submit" value='전송'>
		</form>
	</div>



</body>
</html>