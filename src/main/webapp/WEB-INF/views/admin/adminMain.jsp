<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin</title>
        <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
   
    </head>
    <style>
        *{box-sizing: border-box}
        div{border:1px solid black}

        table{border: 1px solid #999;}
        table tr td{border: 1px solid #999;}

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
                                    <li><a href="/admin/memberAdmin">Member</a></li>
                                    <li><a href="/admin/productAdmin">product</a></li>
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