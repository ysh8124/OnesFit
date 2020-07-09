<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/img/OnesFitFavicon2.ico">
<meta charset="UTF-8">
<title>buylist</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<link rel="shortcut icon" href="/img/onesfitcon.png">
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

#Content_header * {
	background-color: #fbe6d4
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
		<h2>주문관리</h2>
		<table border="1">
			<tr id="Content_header">
				<th>주문번호
				<th>아이디
				<th>제품이름
				<th>제품가격
				<th>제품사이즈
				<th>제품컬러
				<th>수량
				<th>발신인
				<th>우편번호
				<th>주소
				<th>상세주소
				<th>전화번호
				<th>메시지
				<th>상태
				<th>제품번호
				<th>구매날짜
				<th>입금여부
				<th>송장번호
				<th>완료
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="17">글이 없습니다...
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${list}">
						<tr id="content_data">
							<td>${i.bseq }
							<td>${i.parent_id}
							<td>${i.pname }
							<td>${i.price }
							<td>${i.psize }
							<td>${i.pcolor }
							<td>${i.amount }
							<td>${i.recipient }
							<td>${i.zipcode }
							<td>${i.address1 }
							<td>${i.address2 }
							<td>${i.phone }
							<td>${i.msg }
							<td>${i.status }
							<td>${i.product_num }
							<td>${i.buy_date }
							<td><select class="send_money_yn" name="send_money_yn">
									<c:choose>
										<c:when test="${i.send_money_yn eq 'N' }">
											<option value="N" selected="selected">N</option>
											<option value="Y">Y</option>
										</c:when>
										<c:when test="${i.send_money_yn eq 'Y'}">
											<option value="N">N</option>
											<option value="Y" selected="selected">Y</option>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
							</select>
							<td><c:choose>
									<c:when test="${i.send_money_yn eq 'N' }">
										<input type="text" value="${i.send_number }"
											style="width: 120px" disabled="disabled">
									</c:when>
									<c:when test="${i.send_money_yn eq 'Y'}">
										<input type="text" value="${i.send_number }"
											style="width: 120px">
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							<td><input type="button" class="modify" value="수정">
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="19">${navi}
			</tr>

		</table>
		<script>
			$(".modify").on("click", function() {
				var bseq = $(this).closest("tr").find("td").eq("0").html();
				var status = $(this).closest("tr").find("td").eq("13").html();
				var send_money_yn = $(this).closest("tr").find("td").eq("16").find(":selected").val();
				var send_number = $(this).closest("tr").find("td").eq("17").find("input").val();

				//send_money_yn의 option선택
				var send_money_n = $(this).closest("tr").find("td").eq("16").find("select").val("N");
				var send_money_y = $(this).closest("tr").find("td").eq("16").find("select").val("Y");

				//send_number의 input선택
				var send_number_input = $(this).closest("tr").find("td").eq("17").find("input");

				var status_change = $(this).closest("tr").find("td").eq("13");

				if (send_money_yn == 'N') {
					$.ajax({
						url : "/admin/BuyListUpdate",
						dataType : "Json",
						data : {
							bseq : bseq,
							status : status,
							send_money_yn : send_money_yn,
							send_number : send_number
						}
					}).done(function(resp) {
						console.log(resp.send_money_yn);
						if (resp.send_money_yn == 'N') {
							status_change.html("입금전");
							send_number_input.val(0);
							send_number_input.attr('disabled', true);
							alert("수정완료");
						} else {
							send_money_y.prop("selected", true);
							alert("수정 실패");
						}
					})
				} else if (send_money_yn == "Y") {
					if (send_number == 0) {
						$.ajax({
							url : "/admin/BuyListUpdate",
							dataType : "Json",
							data : {
								bseq : bseq,
								status : status,
								send_money_yn : send_money_yn,
								send_number : send_number
							}
						}).done(function(resp) {
							if (resp.send_money_yn == 'Y') {
								status_change.html("입금완료/배송준비중");
								send_number_input.attr('disabled', false);
								alert("수정완료");
							} else {
								send_money_n.prop("selected", true);
								alert("수정 실패");
							}
						})
					} else if (send_number != 0) {
						$.ajax({
							url : "/admin/BuyListUpdate",
							dataType : "Json",
							data : {
								bseq : bseq,
								status : status,
								send_money_yn : send_money_yn,
								send_number : send_number
							}
						}).done(function(resp) {
							console.log(resp.send_number);
							if (resp.send_number > 0) {
								status_change.html("배송중");
								alert("수정완료");
							} else {
								send_number = 0;
								alert("수정 실패");
							}
						})
					}
				}
			})
		</script>
	</div>
</body>
</html>