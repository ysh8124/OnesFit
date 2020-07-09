<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="shortcut icon" href="/img/onesfitcon.png">
<title>Insert title here</title>
</head>

<style>
* {
	box-sizing: border-box;
	font-size: 11px;
}

a {
	color: black;
}

input {
	border: 1px solid #dedede;
}

div {
	border: px solid black
}
#contents {
	float: left;
	width: 300px;
	font-size: 12px;
}

.orderListArea {
	position: relative;
	top: 57px;
	padding-left: 50px
}

#ordertable tr td {
	border: 1px solid #dfdfdf;
}

#shipping_info {
	border: 1px solid #dfdfdf;
	width: 350px;
}

#shipping_info td {
	padding: 10px
}

#shipping_info th {
	text-align: center;
	height: 50px;
}

#input {
	width: 250px
}


</style>

<body>


<div id=OSF_ALL>
		<!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
		<div id="container">

			<!--               중앙 내용-->

				<div id="contents">
					<div class="orderListArea">
						<!-- 회원정보 수정  -->

						<div>
							<div>
							<div>
								<b style="font-size: 13px;">비밀번호를 입력해주세요.</b>
							</div>
								<table id="shipping_info" border="1">

									<tbody>
										  <tr>
											<th scope="row">NEW PASSWORD</th>
											<td><input type=password id="pw"
												style="border: 1px solid #dedede;" name="pw">
													<input type='button' value='확인' id='check'>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					
				</div>
		

			
		</div>
	</div>
	
	<!-- <input type='password' name='pw' id='pw'>
	<input type='button' value='확인' id='check'> -->
	
	<script>
		$("#check").on("click",function(){
			 $.ajax({
	    		   url : "/member/pwcheck",
	    		   data:{    		
	    			  id : "${loginid}",
	    			  pw : $("#pw").val()
	    		   }
	    	   }).done(function(resp){
	    		   if(resp){
	    			   
	    			   if(confirm("정말 탈퇴하시겠습니까?")){
	    				   alert("지금까지 ONESFIT를 이용해주셔서 감사합니다.");
	    				   opener.location.href="/member/leave";
	    				   window.close();
	    			   }
	    		   }else{
	    			   alert("패스워드가 일치하지 않습니다.");
	    		   }
	    	   })
		})
	</script>

</body>
</html>