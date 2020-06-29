<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    </head>
    <body>

        <script>

            var arr1 = ["Apple","Orange","Tomato"];
            var arr2 = ["1000","2000","3000"];

            $.each(arr1,function(index, item){
                console.log(this);
                $.each(arr2,function(index,item){
                    console.log(this);  
                })
            })
        </script>
    </body>
</html>