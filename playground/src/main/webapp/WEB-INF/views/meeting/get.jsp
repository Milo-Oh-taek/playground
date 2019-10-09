<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file = "../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
 
 
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
a:link {color: black;}
a:visited{color: black;}
a:hover{color: black;}

.pagination {
  color: black;
  
  padding: 8px 16px;
  text-decoration: none;
}

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
div {
    display: block;
}
a, a:active, a:hover, a:link, a:visited {
    cursor: hand;
    cursor: pointer;
    color: #1f24cc;
    text-decoration: none;
}
body, html {
    font-size: 16px;
    line-height: 1.45;
    font-family: jejugothic,helvetica,arial,sans-serif;
    font-weight: 400;
    margin: 0;
    padding: 0;
    text-rendering: optimizeLegibility;
    -moz-font-feature-settings: "liga","kern";
    -moz-font-feature-settings: "liga=1, kern=1";
    -ms-font-feature-settings: "liga","kern";
    -o-font-feature-settings: "liga","kern";
    -webkit-font-feature-settings: "liga","kern";
    font-feature-settings: "liga","kern";
}
a, p, em, span, strong {
    -webkit-animation-duration: 0.1s;
    -webkit-animation-name: fontfix;
    -webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
    -webkit-animation-delay: 0.1s;
    }
#map {
  height: 300px;
  width: 200px;
}
  /* Optional: Makes the sample page fill the window. */
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}
.wrap {
     width: 100%;
   }
.wrap textarea {
  width: 100%;
  resize: none;
  overflow-y: hidden; /* prevents scroll bar flash */
  padding: 1.1em; /* prevents text jump on Enter keypress */
  padding-bottom: 0.2em;
  line-height: 1.6;
}

* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}
html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}
.row {
min-height: 100%;
position: relative;
padding-bottom: 19px; /* footer height */
}
header {
background-color: #EFEFEF;
}
section {
background-color: #AFAFAF;
}
ol {
margin: 0;
}
#footer {
	
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
	
    $('.wrap').on( 'keyup', 'textarea', function (e){
      $(this).css('height', 'auto' );
      $(this).height( this.scrollHeight );
    });
    
    $('.wrap').find( 'textarea' ).keyup();
    
    joinChk();
    
    memCnt();
    
    myList1();
    
    myList2();
    
    $("#join").click(function(e){
    	event.preventDefault();
    	var ask = "이 그룹에 참여하시겠어요?";
    	var ask2 = "이 그룹에서 탈퇴하시겠어요?";
    	var name = $('#join').attr('name');
    	if(name == 'join'){
    		if(confirm(ask)){
        		$("#isform").submit();
        	}else{
        		return;
        	}
    		
    	}else{
    		if(confirm(ask2)){
        		$("#isform").submit();
        	}else{
        		return;
        	}
    	}
    
    });
    
    $("#toDelete").click(function(){
    	var mno = ${meeting.mno};
    	var ask = "이 그룹을 삭제하시겠습니까?";
    	if(confirm(ask)){
    		location.href="delete?mno="+mno;
    	}else{
    		return;
    	}
    })
   
    
});

function modify(mno){
	
	alert(mno);
}

function myList2(){
	
	$.ajax({
		type: "get",
		url: "${path}/myList2",
		success: function(result){
			
			if(!result[0]){
				
				$("#List2").html("<h6>--현재 Member로 계신 그룹이 없습니다--</h6>");
			}else{
			
			var output = '<table class="table table-bordered " style="width:95%;"><thead class="thead-dark">';
			
				for(var i=0,leng=result.length|| 0; i<leng; i++){
					
					var mname = result[i].mname;
					var location = result[i].location;
					var whatday = result[i].whatday;
					var chat = result[i].chat;
					var mno = result[i].mno;
					
					output += '<tr>';
					output += '<th colspan="2"><a style="color:white;"href="/meeting/get?mno='+mno+'" >'+ (i+1) + '.' + mname+'</a></th>';
					output += '</tr>';
					output += '<tr><td>'+location+'</td><td>'+whatday+'</td></tr>';
					output += '<tr><td colspan="2"><a href="'+chat+'" target="_blank">'+chat+'</a></td></tr>';
					
				}
				
				output += "</thead></table>"
				
				$("#List2").html(output);
			}
		}
	
	})
}

function myList1(){
	
	$.ajax({
		type: "get",
		url: "${path}/myList1",
		success: function(result){
			
			if(!result[0]){
				
				$("#List1").html("<h6>--현재 leader로 계신 그룹이 없습니다--</h6>");
			}else{
			
				var output = '<table class="table table-bordered " style="width:95%;"><thead class="thead-dark">';
				
				for(var i=0,leng=result.length|| 0; i<leng; i++){
					
					var mname = result[i].mname;
					var location = result[i].location;
					var whatday = result[i].whatday;
					var chat = result[i].chat;
					var mno = result[i].mno;
					
					output += '<tr>';
					output += '<th colspan="2"><a style="color:white;"href="/meeting/get?mno='+mno+'" >'+ (i+1) + '.' + mname+'</a></th>';
					output += '</tr>';
					output += '<tr><td>'+location+'</td><td>'+whatday+'</td></tr>';
					output += '<tr><td colspan="2"><a href="'+chat+'" target="_blank">'+chat+'</a></td></tr>';
					
				}
				
				output += "</thead></table>"
				
				$("#List1").html(output);
			}
		}
	
	})
}

function joinChk(){
	
	var mno = ${meeting.mno};
	
	$.ajax({
		type: "get",
		url: "${path}/meeting/joinChk?mno="+mno,
		success: function(result){
			
			if(result != 0){
				
				$("#join").text("탈퇴하기");
				$("#join").attr("class","btn btn-danger");
				$("#join").attr("name","quit");
				$("#isform").attr("action","/meeting/quit");
			}
		}
		
	});
}

function memCnt(){
	
	var mno = ${meeting.mno};
	
	$.ajax({
		type: "get",
		url: "${path}/meeting/memCnt?mno="+mno,
		success: function(result){
			$("#memberCnt").text("member :"+result+"명");
		}
	})
}

function toModify(){
	var userid = ${meeting.userid};
	var mno = ${meeting.mno};
	location.href="modify?mno="+mno+"userid="+userid;
}
function toDelete(){
	var mno = ${meeting.mno};
	location.href="delete?mno="+mno;
}
</script>

</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;height:100%;position:relative;background-repeat:repeat;">

<div class="row">

	<div class = "col-sm-4" id="left">
		<div align="center" style="margin: 5% 4% 4% 4%;">
			<h3>${username }님의 meeting</h3>
			<br>
			<h5>Leader로 계신 그룹</h5>
			<div id="List1"></div>
			<br>
			<h5>Member로 계신 그룹</h5>
			<div id="List2"></div>
		
		</div>
	</div>

	<div class="col-sm-8 " style="margin-right:0;">
	<br><br>
		<h2>${meeting.mname} </h2>
		
		<div>
			<form id = "isform" action = "/meeting/join" method="post">
			<div style = "width:60%; float:left;">
			
				<img src="../resources/img/${meeting.idValue}_${meeting.originalFile}" class="rounded" style="width:95%; max-width:760px; vertical-align:middle" />
			</div>
			
			<div style = "width:40%; float:left;margin-top:5%;">
				
				<i class="fas fa-map-marker-alt"></i> ${meeting.location}<br>
				<i class="fas fa-user" ></i>leader: ${meeting.userid}<br>
				<i class="fas fa-user-friends" id="memberCnt"></i> <br>
				<i class="far fa-calendar-alt"></i> ${meeting.whatday}<br><br><br><br>
				
				<input type="hidden" name = "mno" value = "${meeting.mno}" />
				<c:choose>
					<c:when test = "${meeting.userid ne username }">
						<button type = "submit" class="btn btn-success" name="join" id="join" >가입하기</button><br>
					</c:when>
					<c:when test = "${meeting.userid eq username }">
						<button type="button" class="btn btn-warning btn-sm" onclick="toModify();">수정하기</button>
						<button type="button" class="btn btn-outline-danger btn-sm" id="toDelete">삭제하기</button>
					</c:when>
				</c:choose>

			</div>
			</form>
			<br>
			
			<br>
			<div  style = "width:60%; height:40%; float:left;">
				<div style="width:95%;">
				<br>
				<h3>info</h3>
				<div class="wrap"><textarea class="form-control" readonly style="width:100%;">${meeting.content}</textarea></div>
				</div>
			</div>
			<div style = "width:40%; float:left;">
				<br>
				<div id="map"></div>
				  <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: <c:out value="${meeting.lat}"/> , lng: <c:out value="${meeting.lng}"/>};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 14, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-4J7dCg3e6PgUukJBfpLBpkY9517OQ1I&callback=initMap">
    </script>
			</div>
			
		</div>

   	 </div>
</div>

<%@ include file = "../includes/footer.jsp" %>
</body>


</html>