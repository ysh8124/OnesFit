<%@ page language='java' contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<style>
* {
	box-sizing: border-box
}

div {
	border: 0px solid black;
}

/*    모든 영역*/
#container {
	height: 1500px
}

/*    왼쪽 메뉴*/
#sidemenu {
	float: left;
	width: 271px;
	position: fixed;
	left: 50px;
	padding: 32px 0 10px 50px;
	border: 0px;
}

#sidefix {
	border: 0px;
}

#sidefix ul {
	list-style: none;
}

#sidefix ul li a {
	text-decoration: none;
	color: black;
	position: relative;
	display: inline-block;
	margin: 7px;
	color: #000;
	font-size: 11px;
	text-transform: uppercase;
}

#sidefix ul li a:hover {
	opacity: 50%
}

#category ul li a {
	font-size: 11px;
}

#search {
	width: 110px;
	height: 17px;
	border: 0;
	vertical-align: middle;
	background: none;
	border-bottom: 1px solid #3e3e3e;
}

/*    중앙 내용*/
#contents {
	float: left;
	width: 1070px;
	height: 1500px;
	margin-left: 430px;
	margin-top: 45px;
	font-size: 11px;
}

#mainpic {
	width: 50%;
	height: 628px;
	float: left;
	padding: 30px;
}

#mainpic>img {
	width: 100%;
	height: 100%;
}

#maindetail {
	width: 50%;
	height: 628px;
	float: left;
	margin-bottom: 100px;
}

#reviewtable {
	border: 1px solid #dfdfdf;
	text-align: center;
	width: 1000px;
	position: relative;
	left: 40px;
}

#reviewtable_write {
	border: 1px solid #dfdfdf;
	text-align: center;
	width: 1000px;
	position: relative;
	left: 40px;
}

#reviewtable th {
	font-weight: normal;
	font-size: 12px;
}

#reviewtable tr td {
	border: 1px solid #dfdfdf;
}

/*    오른쪽 메뉴*/
#rightmenu {
	float: left;
	width: 250px;
	position: fixed;
	right: 130px;
	padding: 49px 80px 0px 0px;
	text-align: right;
}

#rightmenu ul li {
	text-decoration: none;
	color: black;
	display: inline-block;
	margin: 0px 0px 5px 0;
	font-size: 11px;
	text-transform: uppercase;
}

/*        FOOTER*/
.footer {
	font-size: 11px;
	text-align: center;
}

.footer a {
	text-decoration: none;
	color: black;
}

/*부가 설명*/
#detail {
	margin-bottom: 30px;
}

/* 옵션 선택 */
select {
	width: 50%;
	padding: .8em .5em;
	font-family: inherit;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0px;
	margin-bottom: 5px;
	margin-top: 5px;
}

select::-ms-expand {
	/* for IE 11 */
	display: none;
}

/*   버튼*/
#buybtn {
	width: 30%;
	height: 50px;
	background-color: black;
	color: white;
	border: 0;
	border-radius: 5px;
}

#buybtn:hover {
	background-color: lightgray;
	color: black;
	transition-duration: 0.5s;
}

#cartbtn {
	width: 30%;
	height: 50px;
	background-color: whitesmoke;
	border: 0;
	border-radius: 5px;
}

#cartbtn:hover {
	background-color: lightgray;
	color: white;
	transition-duration: 0.5s;
}
/*    상세설명*/
#subdetailheader {
	text-align: center;
}

#subdetail {
	width: 100%;
}

#subpic {
	text-align: center;
}

#subpic>img {
	margin: auto;
	width: 100%;
}

#totalPrice {
	display: none;
}

.item>.del {
	border: 0;
}

#mainimage {
    display: block;
    width: 100%;
}

.magnifier {
	width: 150px;
	height: 150px;
	position: absolute;
	border-radius: 0;
	box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px
		rgba(0, 0, 0, 0.25);
	display: none;
}

input {
	border: 1px solid #dedede;
}

textarea {
	border: 1px solid #dedede;
}
</style>
</head>
<body>
	<!--       전체 영역-->
	<div id=OSF_ALL>

		<!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
		<div id="container">

			<!--               사이드메뉴-->
			<div id="sidemenu">
				<div id="sidefix">
					<a href=""> <img src="/img/logo.png"
						style="width: 130px; position: relative; left: 45px">
					</a>
					<div class="memberpage"> 
                            <ul>
                                <li>
                                <c:choose>
                                	<c:when test="${loginid eq 'pzlogin'}">
                                		<a href="/member/loginInfo">login</a>
                                		<a href="">join us</a>
                                </li>
                                <li>
                                    <a href="">my page</a>
                                    <a href="">cart </a>
                                    <a href="">order</a>                                  
                                </li>
                                	</c:when>
                                	<c:otherwise>
                                		<a href="/member/logout">logout</a>
                                		<a href="">join us</a>
                                </li>
                                <li>
                                    <a href="">my page</a>
                                    <a href="/member/cart?parent_id=${loginid}">cart </a>
                                    <a href="">order</a>                                  
                                </li>
                                	</c:otherwise>
                                </c:choose>
                            </ul>                       
                        </div>


					<div id="category">
						<ul>
							<li><a href="">NEW ARRIVAL</a></li>
							<li><a href="">BEST ITEM</a></li>
							<li><a href="">OUTERWEAR</a></li>
							<li><a href="">TOP</a></li>
							<li><a href="">PANTS</a></li>
							<li><a href="">ACC</a></li>
							<li><a href="" style="font-size: 11px;">OSF DAILY BOOK</a></li>

						</ul>
					</div>

					<div>
						<ul>
							<li><a href=""><img src="/img/search.png"
									style="width: 15px"></a> <input id="search" type="text">

							</li>
						</ul>
						<ul>
							<li><a href="https://www.instagram.com/onesfit__official/?hl=ko" onclick="window.open(this.href,'_blank'); return false;"><img src="/img/instar.png"
									width="20px"
									style="position: relative; top: 6px; border-radius: 9px"></a>
								<a href=""><img src="/img/kakao.png"
									width="20px"
									style="position: relative; top: 6px; border-radius: 9px"></a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div id="contents">
				<div id='mainpic'
					 style="padding: 20px; margin: auto; text-align: center; width: 500px; height: 500px; position: relative; left: 42px;">
					
					<img src="/mainpic/${pdto.title_img }"
						style="width: 100%; height: 100%;" id='mainimage'>
				</div>
				<div id='maindetail'
					style="margin-top: 0px; margin-right: 0px; padding: 20px; height: 500px; color: #555555; position: relative; left: 70px; width: 480px;">
					<form action="payMent" method="post" name="payMent">
						<div style="font-size: 13px;">${pdto.pname }</div>
						<div style="line-height: 50px; height: 210px; font-size: 13px;">
							${pdto.content }</div>
						<div style="line-height: 50px; font-size: 13px;">
							<b>PRICE</b> &nbsp; &nbsp; ${pdto.price}
						</div>


						<div id='option'>
							<div>
								<b>COLOR</b>&nbsp; &nbsp; <select id='color'
									onchange="changeColor()" style="width: 50%">
									<option>[필수] 옵션을 선택해주세요.</option>
									<c:forEach var='i' items='${color }'>
										<option>${i}</option>
									</c:forEach>
								</select>
							</div>

							<div>
								<b>SIZE</b> &nbsp; &nbsp; &nbsp; &nbsp; <select id='size'
									style="width: 50%" onchange="selectSize()">
									<option>[필수] 색상을 선택해주세요.</option>
								</select> <br> <br>
							</div>
							<div id='add'></div>
							<div id='totalPrice'>
								<b>토탈 금액</b>&nbsp;&nbsp;<input type='number' name='sum'
									id='total' size='4' readonly>KRW<br>
							</div>
						</div>
						<br>
						<div>
							<button class="btn btn-dark" id=buybtn type="submit"
								class="btn btn-outline-secondary" value="BUY"
								style="width: 40%; height: 30px; font-size: 13px; position: relative; bottom: 3px;">BUY
								NOW</button>
							&nbsp;&nbsp; <input type="button" value='CART' id='cartbtn'
								style="width: 40%; height: 30px; font-size: 13px;"> <input
								type='hidden' name='pseq' value="${pdto.pseq}">
						</div>
					</form>
				</div>
				<div id='subdetail'>
					<div id='subdetailheader'
						style="position: relative; bottom: 100px; text-align: center;">
						<div id='subpic' style="position: relative; left: 40px;">
							<c:forEach var='i' items='${idto }'>
								<div
									style="width: 500px; height: 500px; float: left; padding: 20px">
									<img src="/subpic/${i.sysname }" style="width: 100%;">
								</div>
							</c:forEach>
						</div>
					</div>
					<table id="reviewtable"
						style="position: relative; left: 40px; font-size: 11px">
						<colgroup>
							<col style="width: 10%">
							<col style="width: 15%">
							<col style="width: 20%">
							<col style="width: 35%">
							<col style="width: 10%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr>
								<th colspan="6"
									style="border: hidden; border-bottom: 1px solid #dfdfdf; text-align: left;"><b>REVIEW</b><br>
									상품의 사용후기를 적어주세요.<br>
								<br></th>
							</tr>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이미지</th>
								<th scope="col" colspan='2'>제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
							<c:choose>
								<c:when test="${empty rdto}">
									<tr>
										<td colspan="6" align="center" style="height: 50px;">게시글이
											없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var='i' items='${rdto}'>
										<tr>
											<td style="border-right: hidden">${i.bno }</td>
											<td style="border-right: hidden"><img
												src="/product/${i.pseq}/review/${i.img}"
												style="width: 90px; height: 90px"></td>
											<td style="border-right: hidden" colspan='2'><a href="#"
												onclick="reviewDetail()">${i.title }</a></td>
											<td style="border-right: hidden">${i.writer }</td>
											<td>${i.write_date }</td>
										</tr>
										<tr style="height: 200px;" class='reviewDetail'>
											<td>${i.bno }</td>
											<td><img src="/product/${i.pseq}/review/${i.img }"
												style="width: 200px; height: 200px;"></td>
											<td colspan='4'
												style="vertical-align: top; text-align: left; padding: 15px;">
												${i.content }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

							<tr
								style="border-left: hidden; border-right: hidden; height: 50px;">
								<td colspan="6" style="text-align: right; border-bottom: hidden">
									<input type="button" value="제품후기작성 "
									style="background-color: white;" id="reviewbtn1">
								</td>
							</tr>
						</thead>
					</table>

					<form action="review" method="post" enctype="multipart/form-data">
						<input type='hidden' name='pseq' value="${pdto.pseq }">
						<table id="reviewtable_write" style="display: none;">
							<colgroup>
								<col style="width: 80px">
								<col style="width: 100%">
							</colgroup>
							<tr style="border-top: hidden;">
								<td style="height: 35px; font-size: 12px;">&nbsp;&nbsp;제목</td>
								<td style="text-align: left;">&nbsp;&nbsp;<input
									name="title" type="text" style="width: 50%; height: 20px;"></td>
							</tr>
							<tr>
								<td colspan="6"><textarea name="content"
										style="width: 100%; height: 250px; font-size: 12px;">키 - / 몸무게

- 구매하신 사이즈와 색상 

- 상품 후기 - (20자 이상으로 작성해 주시기 바랍니다.)
                                            </textarea></td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="width: 100px;">
										<div class="xbox" id='View_area' align=center
											style="border: 1px solid #dedede; width: 200px; height: 200px;">
											<a onclick=document.all.profile_pt.click(); id=atag
												style="color: gray; font-size: 20px; opacity: 70%; line-height: 200px;">IMAGE
											</a>
										</div>
										<input type="file" name="file" id="profile_pt"
											onchange="previewImage(this,'View_area')"
											style="display: none;" />
										<div class="img_notice"
											style="font-size: 12px; text-align: center; color: green">200
											x 200 권장</div>
									</div>
								</td>
							</tr>
							<tr style="border: hidden; border-top: 1px">
								<td colspan="6" style="text-align: right"><input
									type="submit" value="제품후기작성 "
									style="background-color: white; font-size: 12px;"
									id="reviewbtn2"></td>
							</tr>

						</table>
					</form>



					<div class="footer"
						style="float: left; width: 1068px; margin-top: 50px;">
						<a href="">사이트 소개</a> | <a href="">이용약관</a> | <a href="">개인정보취급방침</a>
						| <a href="">이메일 무단수집거부</a> | <a href="">책임의 한계와 법적고지</a> | <a
							href="">이용안내</a> | <a href="">모바일 버전</a> <br> <br>
						<div>
							COMPANY : ONESFIT <br> PHONE : 010-7777-7777 <br> 사업자
							번호 : 145-51-00571 <br> 주소 : 강원도 원주시 우산동 상지대길 9 (402호) <br>
							OWNER : 원에스핏 | WEB MANAGER : 잊재웡 <br> @ OSF ONESFIT

						</div>
					</div>
				</div>
			</div>


			<div id="rightmenu">
				<ul>
					<li><b>OPENING</b></li>
					<br>
					<li class="phone">T. 02-777-7777</li>
					<li class="font10">MON-FRI / 11AM - 5PM</li>
					<li class="font10">lunch / 1AM - 2PM</li>
					<li class="font10">(close, sat sun holiday)</li>
				</ul>


				<ul>

				</ul>
				<ul>
					<li><b>BANK INFO</b></li>
					<br>
					<li>국민 5591-010-4168-906</li>
					<li>ONESFIT (권성택)</li>
				</ul>
			</div>
		</div>

		<input type='hidden' value='${loginId}' id='loginId'> <input
			type='hidden' value='${pdto.pseq }' id='pseq'>
	</div>
	<script>
                    $("#cartbtn")
                        .on(
                        "click",
                        function() {
                            /* var option1 = $("#size option").index(
                                $("#size option:selected"));
                            var option2 = $("#color option").index(
                                $("#color option:selected")); */
                            var size = $.map($('.picksize'), function (el) { return el.value; });
                            var color = $.map($('.pickcolor'), function (el) { return el.value; });
                            var amount = $.map($('.amount'), function (el) { return el.value; });   
                            var length = $(".pickoption").length;
                            
                            if("${loginId}" == "pzlogin"){
                            	alert("로그인 후 이용가능합니다.");
                            	location.href = "../member/loginInfo"
                            }
                            
                            else if(length !=0){
                                $
                                    .ajax(
                                    {
                                        url : "cartAdd",
                                        dataType : "Json",
                                        data : {                                                   
                                            pseq : $("#pseq").val(),
                                            option1 : JSON.stringify(size),
                                            option2 : JSON.stringify(color),
                                            amounts : JSON.stringify(amount),
                                            length :length
                                        }
                                    })
                                    .done(
                                    function(resp) {
                                        if (resp.result > 0) {
                                        	$(".item").remove();
                                        	$("#total").val("0");
                                        	$("#totalPrice").css("display","none");
                                            var check = confirm("장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?");
                                            if (check) {
                                                location.href = "/member/cart?parent_id=${loginid}";
                                            }
                                        } else {
                                            alert("알수 없는 오류로 장바구니에 담기지 않았습니다.");
                                        }
                                    })
                            }
                            else{
                               alert("옵션을 선택해주세요.");
                            }                           
                        })
                </script>
                
	<script> 
                        function changeColor() {
                            $(".sizeoption").remove();
                            if ($("#color option").index($("#color option:selected")) != 0) {            
                                $.ajax({
                                    url : "colorSelect",
                                    data : {
                                        pseq : $("#pseq").val(),
                                        color : $("#color option:selected").val(),
                                    }
                                }).done(
                                    function(resp) {
                                        var optionLen = resp.length;                     
                                        for (var i = 0; i < optionLen; i++) {
                                            if(resp[i].item_count>0){
                                                $("#size").append(
                                                    "<option class='sizeoption'>" + resp[i].psize + "</option>");
                                            }else{
                                                $("#size").append(
                                                    "<option class='sizeoption' disabled>" + resp[i].psize + "[품절]</option>");
                                            }
                                        }
                                    })
                            }          
                        }
                        
                        function selectSize(){
                           var color =$("#color option:selected").val();
                           var size = $("#size option:selected").val();
                           var total = $("#total").val();
                           var length = $(".pickoption").length;
                           var arr = $.map($('.pickoption'), function (el) { return el.value; });
                           
                           if($("#size option").index($("#size option:selected"))!=0){
                              for(var i=0;i<length;i++){                                 
                                 if((color+size)==arr[i]){
                                    alert("이미 선택된 옵션입니다.");
                                    $("#color option:eq(0)").prop("selected",true);
                                      $("#size option:eq(0)").prop("selected",true);
                                      $(".sizeoption").remove();
                                    return false;
                                 }
                              }                              
                                $("#add").append(
                                      "<div class='item'><b>${pdto.pname}</b>&nbsp; &nbsp; &nbsp;<input type='hidden' class='pickoption' value='"+color+size+"'><input type='hidden' class='pickcolor' name='color' value='"+color+"'><input type='hidden' class='picksize' name='size' value='"+size+"'> <input type='number' name='amount' class='amount' value='1' size='1'min='1' onchange='change();'><br>"+
                                      "-"+color+"/"+size+"&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' class='del' value='x'> </div>");
                              $("#total").val(Number(total)+Number(${pdto.price}));  
                              $("#color option:eq(0)").prop("selected",true);
                              $("#size option:eq(0)").prop("selected",true);
                              $(".sizeoption").remove();
                              $("#totalPrice").css("display","block");
                           }
                        }                       
                    </script>
	<script>
                       function change(){
                          var amount=0;
                          var total = $("#total").val();
                          $(".amount").each(function(){
                             amount +=Number($(this).val());                             
                          })
                          if(amount!=0){
                             $("#total").val(amount*${pdto.price});
                          }else{
                             $("#total").val(0);
                              $("#totalPrice").css("display","none");
                          }
                       }      
                       $(document).on("click",".del",function(){
                          $(this).parent("div").remove();
                          return change();
                       })
                        var review = document.getElementById("review");

                        $("#reviewbtn1").on("click",function() {
                            $("#reviewtable_write").css("display","block");
                            $("#reviewbtn1").css("display","none");
                        })
                        
                        function previewImage(targetObj, View_area) {
                var preview = document.getElementById(View_area); //div id
                var ua = window.navigator.userAgent;

                //ie일때(IE8 이하에서만 작동)
                if (ua.indexOf("MSIE") > -1) {
                    targetObj.select();
                    try {
                        var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
                        var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


                        if (ie_preview_error) {
                            preview.removeChild(ie_preview_error); //error가 있으면 delete
                        }

                        var img = document.getElementById(View_area); //이미지가 뿌려질 곳

                        //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                        img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
                    } catch (e) {
                        if (!document.getElementById("ie_preview_error_" + View_area)) {
                            var info = document.createElement("<p>");
                            info.id = "ie_preview_error_" + View_area;
                            info.innerHTML = e.name;
                            preview.insertBefore(info, null);
                        }
                    }
                    //ie가 아닐때(크롬, 사파리, FF)
                } else {
                    var files = targetObj.files;
                    for ( var i = 0; i < files.length; i++) {
                        var file = files[i];
                        var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                        if (!file.type.match(imageType))
                            continue;
                        var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
                        if (prevImg) {
                            preview.removeChild(prevImg);
                        }
                        var img = document.createElement("img"); 
                        img.id = "prev_" + View_area;
                        img.classList.add("obj");
                        img.file = file;
                        img.style.width = '200px';
                        img.style.height = '200px';
                        $("#View_area").html("");
                        img.setAttribute('onclick','document.all.file.click();');
                        preview.prepend(img);
                        $("#View_area").css("border","none");
                        if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                            var reader = new FileReader();
                            reader.onloadend = (function(aImg) {
                                return function(e) {
                                    aImg.src = e.target.result;
                                };
                            })(img);
                            reader.readAsDataURL(file);
                        } else { // safari is not supported FileReader
                            //alert('not supported FileReader');
                            if (!document.getElementById("sfr_preview_error_"
                                                         + View_area)) {
                                var info = document.createElement("p");
                                info.id = "sfr_preview_error_" + View_area;
                                info.innerHTML = "not supported FileReader";
                                preview.insertBefore(info, null);
                            }
                        }
                    }
                }
            }                        
                     $("#mainpic")
                        .on('mousemove', magnify)
                        .prepend("<div class='magnifier'></div>")
                        .children('.magnifier').css({
                            "background": "url('" + $("#mainimage").attr("src") + "') no-repeat"
                        });
                     
                    var target = $('#mainimage');
                    var magnifier = $('.magnifier');
                    function magnify(e) {
                    	 
                        // 1
                        var mouseX = e.pageX - $(this).offset().left;
                        var mouseY = e.pageY - $(this).offset().top;
                     
                        // 2
                        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
                            magnifier.fadeIn(100);
                        } else {
                            magnifier.fadeOut(100);
                        }
                     
                        // 3
                        if (magnifier.is(":visible")) {
                     
                            // 4    
                            var rx = -(mouseX / target.width() * target[0].naturalWidth - magnifier.width() / 2);
                            var ry = -(mouseY / target.height() * target[0].naturalHeight - magnifier.height()  /2);
                     
                            // 5
                            var px = mouseX - magnifier.width() / 2;
                            var py = mouseY - magnifier.height() / 2;
                     
                            // 6
                            magnifier.css({
                                left: px,
                                top: py,
                                backgroundPosition: rx + "px " + ry + "px"
                            });
                        }
                    }
                    

                    </script>
</body>
</html>