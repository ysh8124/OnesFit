<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/img/OnesFitFavicon2.ico">
<meta charset="UTF-8">
<title>qnaAdmin</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>

/* 내비바 */
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

/* 콘텐츠 */
#product_contents {
	position: relative;
	top: 120px;
	left: 350px;
	width: 1500px;
	overflow: auto;
}

#content_header * {
	background-color: #fbe6d4
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
						<li><a href="/admin/productAdmin"> 상품 관리 </a></li>
						<li><a href="/admin/buyList"> 주문 관리 </a></li>
						<li><a href="/admin/memberAdmin">회원 관리</a></li>
						<li><a href="/admin/question">Q&A 관리</a></li>
						<li><a href="">DAILY 게시판</a></li>
						<li><a href="/notice/notice_list?page=1">공지사항 </a></li>
						<li><a href="">팝업 관리</a></li>
						<li><a href=""><i class="fa fa-fw fa fa-question-circle"></i>
								판매자 정보</a></li>
					</ul>
				</div>
			</nav>
	<div id="product_contents" class="product_contents">
		<div id="memberList" class="memberList">
			<h2>Q&A Board</h2>
			<table border="1">
				<tr id="content_header">
					<th width="4%">글 번호
					<th width="5%">제품번호
					<th width="6%">작성자 아이디
					<th width="20%">제목
					<th width="50%">내용
					<th width="5%">작성시간
					<th width="5%">답변 여부
					<th width="5%">답변 작성
				</tr>
				<c:choose>
					<c:when test="${!empty qList }">
						<c:forEach var="i" items="${qList }">
							<tr>
								<td>${i.bno }
								<td>${i.pseq }
								<td>${i.writer }
								<td>${i.title }
								<td>${i.contents }
								<td>${i.write_date }
								<td>${i.answer_yn }
								<td><button type="button" class="answerB">답변쓰기</button>
							</tr>
							<tr>
								<td colspan="8" class="answerB_write" style="display: none;">
									<div class="chatBox"
										style="width: 1000px; margin-left: 1.7%; margin-top: 40px; margin-bottom: 10px;">
										<div class="editor input"
											style="height: 100px; width: 70%; float: left;"
											contenteditable="true"></div>
										<div style="width: 10%; float: left;">
											<input type="button" value="댓글"
												style="width: 100%; height: 100px;" class="cbtn">
										</div>
										<div class="parent_bno" style="display: none">${i.bno}</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${empty qList }">
						<tr>
							<td colspan="8">글이 없습니다.
						</tr>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<tr>
					<td colspan="8">${qnavi}</td>
				</tr>
			</table>

			<script>
				$(function() {
					$(".cbtn").on("click", function() {

						var bno = $(this).closest(".chatBox").find(".parent_bno").html();
						var aInput = $(this).closest(".chatBox").find(".input").html();

						$.ajax({
							url : "/admin/AnswerInput",
							dataType : "Json",
							data : {
								bno : bno,
								aInput : aInput
							}
						}).done(function(resp) {
							console.log("success");
							$(this).closest("tr").prev().find("td").eq(6).text("N");
							alert("답변 등록 성공");
						})
					})

					$(".answerB").on("click", function() {
						$(".answerB_write").css("display", "none");
						$(this).closest("tr").next().find(".answerB_write").css("display", "table-cell");
					})
				})
			</script>
		</div>
	</div>
</body>
</html>