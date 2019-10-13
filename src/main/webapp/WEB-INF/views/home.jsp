<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

 <style>

.groupCard--photo {
    width: 100%;
    height: 180px;
    border-radius: 3px;
    text-decoration: none;
    background-color: #333;
    box-shadow: 0 0 1px rgba(0,0,0,.05);
    background-clip: content-box;
    background-size: cover;
    background-position: 50% 20%;
    border: 1px solid rgba(0,0,0,.12);
    -webkit-tap-highlight-color: transparent;
}
.nametag-photo {
    width: 180px;
    height: 180px;
    background-size: cover;
    background-position: center 20%;
    position: relative;
    overflow: hidden;
    display: block;
    background-color: #333;
}
.groupCard--gradient {
    height: 100%;
    width: 100%;
    position: absolute;
    background-color: transparent;
    background-image: -webkit-linear-gradient(rgba(15,20,31,0) 0,rgba(15,20,31,.1) 25%,rgba(15,20,31,.8) 100%);
    background-image: linear-gradient(rgba(15,20,31,0) 0,rgba(15,20,31,.1) 25%,rgba(15,20,31,.8) 100%);
}

a, a:active, a:hover, a:link, a:visited {
    cursor: hand;
    cursor: pointer;
    color: #1f24cc;
    text-decoration: none;
}

a, p, em, span, strong {
    -webkit-animation-duration: 0.1s;
    -webkit-animation-name: fontfix;
    -webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
    -webkit-animation-delay: 0.1s;
}
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}
html {
width: 100%;
height: 85%;
}
body {
width: 100%;
margin: 0;
height: 85%;
}

header {
background-color: #EFEFEF;
}
#footer {
position:fixed;
bottom: 0px;
height: 60px;

width: 100%;

padding: 15px 0;

text-align: center;

background: black;

color: white;
}


</style>
<script>
$(document).ready(function() {
	getLocation();
	
	getId();
	
	time()
});


function getId(){
	$.ajax({
		url: "/username",
		type: "get",
		success: function(result){
			
			$("#username").html(result);
			
		}
		
	});
};

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(locationSuccess,locationError,{enableHighAccuracy:true, maximumAge:60000});
	}else{
		console.log("==no geolocation==");
	}
};

function locationSuccess(position){
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
		
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&appid=a3c8c4c0ed78e2485fddcc0555c05acd";
	
	$.ajax({
		url: apiURI,
		dataType:"json",
		type: "get",
		async:"false",
		success: function(result){
			
			$("#city").html(result.name +", "+ result.sys.country);
			var iconURL = "http://openweathermap.org/img/w/" + result.weather[0].icon + ".png";
			$("#icon").attr("src",iconURL);
			var deg = (result.main.temp)-273.15;
			$("#degree").html(Math.round(deg)+"℃");
			$("#status").html(result.weather[0].description);
		}
	})
	
};

function locationError(error){
	var errorTypes = {
			0: "알수없는 에러",
			1: "위치확인 권한거부",
			2: "위치를 찾을 수 없음",
			3: "응답시간 초과"
	};
	var errorMsg = errorTypes[error.code];

	$("#city").html(errorMsg);
};

function time(){
	
	var currentTime = new Date();
	var calendar = currentTime.getFullYear() + "-" + (currentTime.getMonth()+1) + "-" + currentTime.getDate();
	var amPm = "AM";
	var Hours = currentTime.getHours();
	var Minutes = currentTime.getMinutes();
	var Seconds = currentTime.getSeconds();
	if(Hours <10) {Hours = '0'+Hours;}
	if(Minutes <10) {Minutes = '0'+Minutes;}
	if(Seconds <10) {Seconds = '0'+Seconds;}
	
	if(Hours >= 12){
		amPm = 'PM';
		
	}
	$("#clock").html(Hours+":"+Minutes+":"+Seconds+"<span style='font-size:0.5em;'>"+amPm+"</span>");
	
	setTimeout("time()",1000);
};


</script>
</head>
<body style="background-image:url(resources/img/패턴.jpg);background-size:cover;position:relative;background-repeat:repeat;">

<div class="groupCard--photo loading nametag-photo " style="background-image: url(resources/img/playground2.jpg); width:100%; height:300px; position:relative;background-position: 50% 60%;background-size: cover;">
</div>
	
	<!--  메인 사진 끝 -->
	
	<!--  메뉴 시작-->
<%@ include file = "includes/header.jsp" %>
	<!-- 메뉴 끝 -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h2 align="center">PLAYGROUND</h2><br>
      	<sec:authorize access="isAnonymous()">
      		<div style="border:1px solid #dedede; padding-top:15px; height:80px; color:#666; text-align:center;vertical-align:middle;">
		      	<div align="center">
					<button type="button" class="btn btn-dark" style = "width:80%;" onclick="location.href='loginPage'">Login</button>
				</div>
				<div class="form-group" align="center">
					<a href="member/signup" style="color:black;">Not a member? Join us now!</a>
				</div>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			
				<div align="center"><h5 id="username"></h5>님 환영합니다.</div>
			
		</sec:authorize>
		<br>
      	<h3 align="center">Current weather</h3>
     	<table class="table table-bordered" cellpadding="0" cellspacing="0" align="center" height="70px" width="50%" style="padding-bottom:10px;text-align:center;">
	     	<tr height="10%">
	     		<th colspan="2"><div id="city" align="center"></div></th>
	     	</tr>
	     	<tr>
	     		<td rowspan="2" width="50%"><img id="icon" width="60%" height="80%"/></td>
	     		<td style="vertical-align:bottom;"><h3 id="degree"></h3></td>
	     	</tr>
	     	<tr>
	     		<td><h6 id="status"></h6></td>
	     	</tr>
     	</table>
     	
     	<div height="80px" style="border:1px solid #dedede;width:100%; line-height:80px;height:80px; color:#666;font-size:4em; text-align:center;vertical-align:middle;" id="clock"></div>
      <hr class="d-sm-none">
    </div>
    
    
    <div class="col-sm-8">
      <h4>New Group!</h4>
      	<table border="0"  width="100%">
			<tr>
				<c:forEach items="${newMeetingList }" var="list">
					<td>
						<a href="/meeting/get?mno=${list.mno }" >
						<div class="groupCard--photo loading nametag-photo " style="position:relative;height:150px; width:240px; background-image: url(resources/img/${list.idValue}_${list.originalFile});" >
				 		<div class="groupCard--gradient"></div>
		                            
				 		<div class="groupCard--content nametag-photo-name groupCard--title" style="position:absolute;  left:10px;bottom:0px;">
		
		                      <h6 style="color:white; font-family:nanumpenscript;"class="padding-none inline-block loading" itemprop="name">${list.mname}</h6>
		                      
						</div>
		
							
						</div>
						</a>
					</td>
				</c:forEach>
			</tr>
		</table>	
      <br>
      <h4>Hot Group!</h4>
      	<table  border="0" class="table-responsive" width="70%">
			<tr>
				<c:forEach items="${hotMeetingList }" var="list">
					<td>
						<a href="/meeting/get?mno=${list.mno }" >
						<div class="groupCard--photo loading nametag-photo " style="background-image: url(resources/img/${list.idValue}_${list.originalFile}); width:240px; height:150px; position:relative;">
				 		<div class="groupCard--gradient"></div>
		                            
				 		<div class="groupCard--content nametag-photo-name groupCard--title" style="position:absolute;  left:10px;bottom:0px;">
		
		                      <h6 style="color:white; font-family:nanumpenscript;"class="padding-none inline-block loading" >${list.mname}</h6>
						</div>
						</div>
						</a>
					</td>
				</c:forEach>
			</tr>
		</table>
      
    </div>
  </div>
</div>

<div id="footer">
contact : oht366@gmail.com<br>
Copyright © 2019. All rights reserved. 

</div>

</body>
</html>
