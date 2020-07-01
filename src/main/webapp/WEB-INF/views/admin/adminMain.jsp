<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
   
    </head>
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
        

        /*    중앙 내용*/
        #contents{width: 1598px; height: 900px; margin-left: 287px;
            padding : 100px}
        #point{width: 100px;}

    </style>
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
                              <b>OneSFit_Admin</b>    
                              
                    </div>
                    <div id=chart>
                    <div style="float: left; padding: 50px;">
                     <canvas id="myChart" width="400" height="400"></canvas>
                     </div>
                     
                     <div style="float: left;padding: 50px;"><canvas id="myChart2" width="400" height="400"></canvas></div>
                   
                        </div>
            </div>
            <div id="footer">FOOTER</div> 

        </div>
        <script>
            /* bar, line, Polar Area  */
	var ctx = document.getElementById('myChart');
            var ctx2 = document.getElementById('myChart2');
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['0', '15','30','15','30'],
			datasets: [{
				label: '이번 달 매출',
				data: [3, 5, 3, 8,10],
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
				data: [8, 15, 15, 20,17],
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
			labels: ['0', '15','30','15','30'],
			datasets: [{
				label: '방문자 수',
				data: [3, 5, 7, 8,10],
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