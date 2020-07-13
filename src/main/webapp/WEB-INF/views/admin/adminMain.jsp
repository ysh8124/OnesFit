<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="shortcut icon" href="/img/onesfitcon.png">
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


	
	$(function(){
        if("${totalSale}" != undefined){
			var sum = ${totalSale};
			var avg = ${totalSale/12};
			var setA = Math.floor(avg);
			var sum2 = numberWithCommas(sum);
			var setA2 = numberWithCommas(setA);
        }
var text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 매출 : "+sum2+" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월 평균 매출 : "+setA2;
	$("#myChart").after(text);
	
	$(".count").each(function(){
		var num = $(this).html();
		var num2 = Math.floor(num);
		$(this).html(num2);
	})
	
	
		$(document).on("click",".bestBtn",function(index,item){
			var arr = [];
			var url = "/admin/setBest?"
			$(".check").each(function(index2,item2){
				var index = 0;
				if($(item2).is(":checked")){
					var seq = $(item2).parent().next().next().text();
					url += "pseq="+seq+"&&";
					index++;
				}
				
			})
			if(index > 0){
			if(confirm("베스트 상품을 등록하시겠습니까?")){
			location.href=url;
			}
			}else{alert("선택된 상품이 없습니다.");}
		})
		
		
		$(document).on("click",".best",function(){
			var pseq = $(this).closest("tr").children().eq("2").html();
			if(confirm("베스트 상품으로 등록 하시겠습니까?")){
				alert("베스트 상품 등록완료. 상품관리 에서 가능합니다.");
				location.href="/admin/setBest?pseq="+pseq;
			}
		})
		
		$("#allcheck").on("change",function(){
			if($("#allcheck").is(":checked")){
				$(".check").prop("checked",true);
			}else{
				$(".check").prop("checked",false);
			}
		})
		
		$(".check").on("change",function(){
			var checkbox = true;
			$(".check").each(function(){
				if(!$(this).is(":checked")){
					checkbox = false;
				}
			})
			if(checkbox){
				$("#allcheck").prop("checked",true);
			}else{
				$("#allcheck").prop("checked",false);
			}
		})
		
	})
</script>
</head>
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
/*    중앙 내용*/
#dash {
	text-align: center;
	padding-left: 400px;
}

#orderList {
	padding-left: 450px;
	width: 1300px;
}

#ordertable {
	border: 1px solid #dfdfdf;
	text-align: center;
	width: 1300px;
	font-size: 14px;
}

#ordertable th {
	text-align: center;
}

#ordertable tr td {
	border: 1px solid #dfdfdf;
}

#point {
	width: 100px;
}

.best:hover {
	cursor: pointer;
}
</style>
<body>
	<!--       전체 영역-->
	<div id=OSF_ALL>
		<!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
		<div id="container">

			<!--               사이드메뉴-->
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

			<div style="margin-top: 100px; padding-left: 220px;">
				<h2 style="font-size: 15px; text-align: center; line-height: 30px">
					<b>DASH BOARD</b>
			</div>


			<div id="dash">
				<div id=chart style="padding-left: 100px;">
					<div style="float: left; padding: 30px;">
						<canvas id="myChart" width="500" height="500"></canvas>
					</div>

					<div style="float: left; padding: 30px;">
						<canvas id="myChart2" width="500" height="500"></canvas>
					</div>
				</div>
			</div>



			<div id="orderList">
				<table id="ordertable">
					<tr align=center>
						<td style="width: 2%"><input type="checkbox" id="allcheck">
						<td style="width: 5%">판매순위
						<td style="width: 5%">상품<br>번호
						<td style="width: 25%">상품명
						<td style="width: 10%">상품가격
						<td style="width: 10%">상품분류
						<td style="width: 5%">판매수량
						<td style="width: 15%">품목매출
						<td style="width: 10%">비고
					</tr>
					<script>var check=0;</script>
					<c:forEach var="i" items="${ranklist}" varStatus="s">
						<c:forEach var="j" items="${topProduct}">

							<c:choose>
								<c:when test="${i.product_num == j.pseq}">
									<script>check++;</script>
									<tr align=center class="print">
										<td><input type="checkbox" class="check">
										<td>${s.index+1}
										<td class="pseq">${j.pseq}</td>
										<td>${j.pname }
										<td class="onePrice">${j.price }
										<td>${j.category }
										<td class="count">${i.price/j.price }
										<td class="totalPrice">${i.price}
										<td class="best">best
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:forEach>
					<script>if(check == 0){$("table").append("<tr align=center><td colspan=9>판매 품목이 없습니다.</tr>");}</script>
				</table>
			</div>
		</div>
		<script>var sale = [];</script>
		<c:forEach var="s" items="${sales}" varStatus="now">
			<script>
        var ctx = document.getElementById('myChart');
        var ctx2 = document.getElementById('myChart2');
        console.log("현재 값은 : " + ${s} );
        if("${now.last}"){
        if("${now.index}" < 3){
        	sale.push(${s});
        	sale.push(0);
        	sale.push(0);
        }else if(${now.index} < 4){
        	sale.push(${s});
        	sale.push(0);
        }else{sale.push(${s});}
        }else{sale.push(${s});}
        </script>
		</c:forEach>
		<script>
		var visit = [];</script>
		<c:forEach var="v" items="${visit}" varStatus="now2">
			<script>
        var ctx = document.getElementById('myChart');
        var ctx2 = document.getElementById('myChart2');
        console.log("현재 값은 : " + ${v} );
        if(${now2.last}){
        if(${now2.index} < 3){
        	visit.push(${v});
        	visit.push(0);
        	visit.push(0);
        }else if(${now2.index} < 4){
        	visit.push(${v});
        	visit.push(0);
        }else{visit.push(${v});}
        }else{visit.push(${v});}
        </script>
		</c:forEach>
		<script>
            /* bar, line, Polar Area  */
	
            
            var date = new Date().getMonth()+1;
            console.log(date);
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: [date-4, date-3,date-2,date-1,date],
			datasets: [{
				label: '이번 달 매출',
				data: [sale[4],sale[3],sale[2],sale[1],sale[0]],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 50, 1)',
					'rgba(54, 162, 152, 1)',
					'rgba(20, 20, 10, 1)',
					'rgba(20, 52, 2, 1)'
				],
				borderWidth: 1
			},
            {
				label: '총 매출',
				data: [${totalSale}-sale[0]-sale[1]-sale[2]-sale[3], ${totalSale}-sale[0]-sale[1]-sale[2], ${totalSale}-sale[0]-sale[1], ${totalSale}-sale[0],${totalSale}],
				backgroundColor: [
					'rgba(20, 150, 132, 0.2)',
					'rgba(20, 112, 205, 0.2)',
					'rgba(2, 152, 86, 0.2)',
					'rgba(20, 112, 152, 0.2)'

				],
				borderColor: [
					'rgba(120, 29, 132, 0.2)',
					'rgba(54, 122, 235, 0.2)',
					'rgba(120, 122, 86, 0.2)',
					'rgba(75, 102, 102, 0.2)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
            
            var myChart2 = new Chart(ctx2, {
		type: 'line',
		data: {
			labels: [date-4, date-3,date-2,date-1,date],
			datasets: [{
				label: '방문자 수',
				data: [visit[4], visit[3],visit[2],visit[1],visit[0]],
				backgroundColor: [
					'rgba(0, 200, 0, 0.2)',
					'rgba(0, 200, 0, 0.2)',
					'rgba(0, 200, 0, 0.2)',
					'rgba(0, 200, 0, 0.2)'

				],
				borderColor: [
					'rgba(255, 99, 50, 1)',
					'rgba(54, 162, 152, 1)',
					'rgba(20, 20, 10, 1)',
					'rgba(20, 52, 2, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
            
            
</script>
</body>
</html>