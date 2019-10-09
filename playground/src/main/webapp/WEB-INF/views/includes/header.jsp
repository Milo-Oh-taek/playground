<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{margin-right:60px;}
</style>
<script>

$(document).ready(function(){
	
	$("#logout").click(function(e){
		
		event.preventDefault();
		
		var ask = "로그아웃 하시겠습니까?";
		if(confirm(ask)){
			$("#isForm2").submit();
		}else{
			return;
		}
	});
})

</script>
</head>
<body>

<div class="panel panel-default">

	<div class="panel-heading"></div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div align="left">
		<a class="navbar-brand" href="#">
		  <img src="\resources\img\Slide-512.png" alt="Logo" style="width:40px;">
		</a>
		<a class="navbar-brand" href="/">Home</a>
		<a class="navbar-brand" href="/board/list">Board</a>
		<a class="navbar-brand" href="/meeting/list">meeting</a>
		</div>
		<div style="width:75%;"></div>
		
		<form action="/customLogout" method="post" id="isForm2">
		<div align="right" style="margin-right:0;">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<sec:authorize access="isAnonymous()">
			<button type="button" class=" btn btn-dark btn-sm" onclick="location.href='/loginPage'">Login</button>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<button type="submit" id="logout" class=" btn btn-dark btn-sm" >Logout</button>
		</sec:authorize>
		</div>
		</form>
  
	</nav>
	
</div>

</body>
</html>