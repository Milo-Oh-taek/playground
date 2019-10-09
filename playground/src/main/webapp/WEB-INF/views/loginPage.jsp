<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file = "includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
 
 
<title>Insert title here</title>
<style>
a:link {color: black;}
a:visited{color: black;}
a:hover{color: black;}
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}
html {
height: 950px;
}
body {
margin: 0;
height: 950px;
}
.row {
min-height: 100%;
position: relative;
padding-bottom: 19px; /* footer height */
}
header {
background-color: #EFEFEF;
}
#footer{
bottom:0;
position:fixed;
height:60px;
width:100%;
background:black;
color:white;
}

</style>

<script>
$(document).ready(function(){
	
	$("#goSubmit").click(function(){
		if($("#loginid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#loginid").focus();
			return false;
		}else if($("#loginPwd").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("#loginPwd").focus();
			return false;
		}else{
			$("#isForm").submit();
		}
	});
	
	
});
</script>
</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;position:relative;background-repeat:repeat;">

	<div class="groupCard--photo loading nametag-photo " style="background-image: url(../resources/img/playground2.jpg); width:100%; height:300px; position:relative;background-position: 50% 60%;background-size: cover;">
	
	</div>
	
	
	
	<div align="center" style="margin-top:8%;" >
		<h2>PLAYGROUND</h2><br><br>
		
		
		<form action = "/login" method="post" id="isForm">
		<div class="form-group">
			<input type="text" style = "width:30%;  "class="form-control" name="loginid" id="loginid" value="${loginid }" />
		</div>
		<div class="form-group">
			<input type="password" style = "width:30%;  "class="form-control" name="loginPwd" id="loginPwd" value="${loginpw}"/>
		</div>
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			<c:choose>
				<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
					
					<div><font color="red">아이디 혹은 비밀번호가 맞지 않습니다.</font></div>
				</c:when>
				<c:otherwise>
					<div><font color="red">비활성화된 계정입니다. 관리자에게 문의해주세요.</font></div>
				</c:otherwise>
			</c:choose>
			<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
		</c:if>
		<div >
			<button type="submit" class="btn btn-dark" style = "width:30%;" id = "goSubmit">Login</button>
		</div>
		
		<br>
		<div class="form-group" style="align:center;">
			<a href="member/signup">Not a member? Join us now!</a>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		
		</form>
		
		
	</div>
	

	

	
<div id="footer" align="center">
contact : oht366@gmail.com<br>
Copyright © 2019. All rights reserved. 

</div>
</body>

</html>