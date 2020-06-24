<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product Add</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
* {
	box-sizing: border-box;
}

.container {
	width: 1200px;
	height: 900px;
	margin-left: 307px;
	padding: 20px
}

.text {
	border: 2px solid black;
	border-radius: 6px;
}

#logo {
	width: 100%;
	background-color: #f6f6f6;
	
	text-align: center;
	height: 100px;
	line-height: 100px;
	font-size: 30px;
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
	height: 200px;
}

#submit {
	width: 100px;
	height: 30px;
    border: 1px solid #c4c4c4; background-color: rgba(266,266,266,0); color: #c4c4c4; 
}

/*    왼쪽 메뉴*/
#sidemenu {
	float: left;
	width: 287px;
	padding: 180px 0 10px 50px;
	background-color: #f6f6f6;
    border: 1px solid #eeeeee;
	height: 959px;
	position: fixed;
}

#sidefix ul {
	list-style: none;
}

#sidefix ul li a {
	text-decoration: none;
	color: black;
	position: relative;
	display: inline-block;
	margin: 30px 15px 5px 0;
	color: #000;
	font-size: 16px;
	letter-spacing: 0;
	text-transform: uppercase;
}

#xbox2 img{width:200px;height:200px;}
#xbox2 img:hover{cursor:pointer;}

#img_box a:hover{cursor: pointer;}
#prev_View_area:hover{cursor: pointer;}
</style>

<script>
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

    $(function(){
    	$('#files').change(function(){
            const target = document.getElementsByName('files');
            
            var html = '';
            $.each(target[0].files, function(index, file){
                const fileName = file.name;
                html += '<img src="'+URL.createObjectURL(file)+'"onclick=document.all.files.click();>'
                const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
                if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
                    alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
                    resetFile();
                    return false;
                }
                $("#xbox2").css("border","none");
                $('#xbox2').html(html);
            });
     
        });


    	
    	$("#price").focusout(function(){
    		if($("#price").val() != ""){
 		   var price=$("#price").val();
 		   var ctx = /^\d{1,100}$/g;
            if(!ctx.test(price)){
            $("#price").val("");
            alert("숫자만 입력해주세요.");
            $("#price").focus();}
    		}
        })

$("#submit").on("click",function(){
	if($("input[name=category]").val() != null){
            if($("#pname").val() != ""){
            	if($("#price").val() != ""){
            		if($("#content").val() != ""){
            			if($("input[name=file]").val() != null && $("input[name=files]").val() != null){
            			alert("상품 등록에 성공하였습니다.");
            			return true;
            			/* location.href="/product/productAdd.proc?pname="+$('#pname').html()+"&&price="+$('#price').html()+"&&content="+$('#content').val()+"&&category="+$('input[name=category]').val()+"&&file="+$('input[name=file]').val()+"&&files="+$('input[name=files]').val(); */
            			}else{alert("사진을 등록해주세요.");return false;}
            			}else{alert("상품 설명을 입력해주세요");return false;}
            	}else{alert("상품 가격을 입력해주세요.");return false;
            	}
            }else{alert("상품명을 입력해주세요.");
            return false;}                                                                 
           }else{
               alert("상품 분류를 선택해주세요.(체크박스)");
               return false;}
       
})


    })
   
    </script>
</head>
<body>
	<div id=OSF_ALL>
		<!--           왼쪽메뉴, 중앙 내용, 오른쪽 메뉴 -->
		<div id="container">


			<!--               사이드메뉴-->
			<div id="sidemenu">

				<div id="sidefix">
					<h1 style="text-align: center">
						<div style="margin-right: 80px;">Manager</div>
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
		</div>
	</div>


		<div class="container">
		<form action="/product/productAdd.proc" method="post" enctype="multipart/form-data" accept-charset="utf8">
			<div id="logo">상품 등록</div>
			<br>
			<div id="product_box">상품정보</div>
			<!-- 상단 내용 -->
			<br> 상품명
			<div id=top>
				<input type=text name=pname class=text
					style="width: 300px; float: left;" id="pname">
				<div id="check_div">
					<input type=radio value="outer" name="category">outer <input
						type=radio value="top" name="category">top <input
						type=radio value="bottom" name="category">bottom <input
						type=radio value="acc" name="category">acc
				</div>
				<br>상품 가격<br>
				<input type=text name=price class=text style="width: 300px;"
					id="price">
			</div>

			<br>
			<!-- 상품설명 시작 -->
			<div id=bottom>
				<br>
				<div>상품 설명</div>
				<textarea id="content" style="width: 60%; height: 300px;"
					name="content"></textarea>
				<br>
				<br>
				<div id="img_box">
					<div id="img_title">이미지 정보</div>
					<br> 대표 이미지
					<div class="xbox" id='View_area' align=center>
						<a onclick=document.all.profile_pt.click(); id=atag
							style="width: 200px; height: 200px; display: block; line-height: 200px; text-decoration: none; color: gray; font-size: 70px; opacity: 30%">+</a>
					</div>
					<input type="file" name="file" id="profile_pt" onchange="previewImage(this,'View_area')" style="display: none;"/>
					<div class="img_notice">1000 x 1000 권장</div>
					<br> <br> 이미지
					<div class="xbox" id=xbox2 align=center>
						<a onclick=document.all.files.click();
							style="width: 200px; height: 200px; display: block; line-height: 200px; text-decoration: none; color: gray; font-size: 70px; opacity: 30%">+</a>
					</div>
					<input multiple="multiple" name="files" id="files" type="file" style="display:none;"/>
					<div class="img_notice">1000 x 1000 권장</div>
				</div>

			</div>
			<br>
			<br> <input type=submit value="등록하기" id=submit
				style="margin-left: 500px">
				</form>
		</div>
</body>
</html>