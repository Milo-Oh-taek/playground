<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
<style>

a:active, a:hover, a:link, a:visited {
    cursor: hand;
    cursor: pointer;
    color: white;
    text-decoration: none;
    
}

body {margin: 0;}

ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #4CAF50;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}
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

	<ul class="topnav">
	  <li><a class="active" href="/">Home</a></li>
	  <li><a href="/board/list">Board</a></li>
	  <li><a href="/meeting/list">Play</a></li>
	  <li class="right">
	  	<form action="/customLogout" method="post" id="isForm2">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			
			<sec:authorize access="isAnonymous()">
				<a href="/loginPage">Login</a>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<a style="color:white;" id="logout" >Logout</a>
			</sec:authorize>
			
		</form>
	  </li>
	</ul>
		
	
</div>

</body>
</html>