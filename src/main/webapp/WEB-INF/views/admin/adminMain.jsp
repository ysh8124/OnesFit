<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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


                    <div id="contents">
                    <div style="width:100%">
                              <b>Member Management</b>    
                              <select style="margin-left: 900px;">
                                 <option>아이디</option>
                                 <option>이름</option>
                                 <option>별명</option>
                                 </select>   
                               <input id="search" type="text">     
                                <a href=""><img src="glass.png" style="width: 17px"></a>
                    </div>
                      
                   
                </div>

            </div>
            <div id="footer">FOOTER</div> 

        </div>
    </body>
</html>