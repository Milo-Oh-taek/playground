<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file = "../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
 
 
<title>Insert title here</title>
<style>
a:link {color: black;}
a:visited{color: black;}
a:hover{color: black;}

.pagination {
  color: black;
  
  padding: 8px 16px;
  text-decoration: none;
}
</style>

<script>
$(document).ready(function(){
	
	$("#userid").focus();
});

function idDup(){
	
	var userid = document.getElementById("userid").value;
	
	var regExpId = /^[A-Za-z0-9]{5,20}$/;
	
	$.ajax({
		type:"get",
		url: "${path}/member/checkId?userid=" + userid,
		success: function(data){
			
			if(data == 1){
				$("#showResult").text("이미 사용중입니다.");
				$("#showResult").css("color","red");
				$("#isSubmit").attr("disabled",true);
			}else{
				
				if(!(regExpId.test(userid))){
					$("#showResult").text("소문자 영문 & 숫자만 가능합니다(5~20글자)");
					$("#showResult").css("color","red");
					$("#isSubmit").attr("disabled",true);
					
				}else{
					$("#showResult").text("사용가능합니다.");
					$("#showResult").css("color","blue");
					$("#isSubmit").attr("disabled",false);
				}
			}
		}
		
		
	});
	
};

function pwChk(){
	var pw = document.getElementById("userpw").value;
	var pw2 = document.getElementById("userpw2").value;
	
	if(pw != pw2){
		$("#pwResult").text("password 불일치");
		$("#pwResult").css("color","red");
		$("#isSubmit").attr("disabled",true);
	}else{
		$("#pwResult").text("");
		$("#isSubmit").attr("disabled",false);
	}
	
}

function pwChk1(){
	var pw = document.getElementById("userpw").value.length;
	
	if(pw<8 || pw>20){
		$("#pwResult1").text("password는 8~20이어야 합니다.");
		$("#pwResult1").css("color","red");
		$("#isSubmit").attr("disabled",true);
		
	}else{
		$("#pwResult1").text("");
		$("#isSubmit").attr("disabled",false);
	}
	
	
}



function chkAll(){
	
	var userid = document.getElementById("userid").value;
	var userpw = document.getElementById("userpw").value;
	var userpw2 = document.getElementById("userpw2").value;
	var username = document.getElementById("username").value;
	var email = document.getElementById("email").value;
	
	if (userid == "" || userid == null) {alert("ID를 입력해주세요"); $("#userid").focus(); return false;}
	if (userpw == "" || userpw == null) {alert("PW를 입력해주세요"); $("#userpw").focus(); return false;}
	if (userpw2 == "" || userpw2 == null) {alert("비밀번호를 확인해주세요"); $("#userpw2").focus(); return false;}
	if (username == "" || username == null) {alert("이름을 입력해주세요"); $("#username").focus(); return false;}
	if (email == "" || email == null) {alert("이메일을 입력해주세요"); $("#email").focus(); return false;}
	
	
	return true;
};







</script>
</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;position:relative;background-repeat:repeat;">

	<div class="groupCard--photo loading nametag-photo " style="background-image: url(../resources/img/playground2.jpg); width:100%; height:300px; position:relative;background-position: 50% 60%;background-size: cover;">
	
	</div>
	
	<div align="center" style="margin-top:2%;">
		<h2>PLAYGROUND</h2><br>
		
		
		<form action = "/member/signup" method="post"  onsubmit="return chkAll()">
		
		<div class="form-group">
			<label for="userid"><b>ID </b></label> 
			<input type="text" style = "width:30%;  "class="form-control" name="userid" id="userid" onkeyup="idDup();"/>
			<div id="showResult" style="width:15px; height:10px; display:inline;"></div>
		</div>
		<div class="form-group">
			<label for="userpw"><b>Password </b></label>
			<input type="password" style = "width:30%;  "class="form-control" name="userpw" id="userpw" onkeyup="pwChk1();"/>
			<div id="pwResult1" style="width:15px; height:10px; display:inline;"></div>
		</div>
		<div class="form-group">
			<label for="userpw2"><b>Confirm Password </b></label>
			<input type="password" style = "width:30%;  "class="form-control"  name="userpw2" id="userpw2" onkeyup="pwChk();"/>
			<div id="pwResult" style="width:15px; height:10px; display:inline;"></div>
		</div>
		<div class="form-group">
			<label for="username"><b>Name </b></label>
			<input type="text" style = "width:30%; "class="form-control" name="username" id="username"/>
		</div>
		<div class="form-group">
			<label for="email"><b>Email </b></label>
			<input type="email" style = "width:30%;  "class="form-control" name="email" id="email"/>
		</div>
		<div >
			<button type="submit" class="btn btn-dark" id = "isSubmit" style = "width:30%;  " >Sign Up</button>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		</form>
	</div>
	



	

</body>
</html>