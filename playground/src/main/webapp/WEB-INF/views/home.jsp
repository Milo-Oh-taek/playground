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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
 
 
<title>Insert title here</title>
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
height: 75%;
}
body {
margin: 0;
height: 75%;
}
.row {
min-height: 100%;
position: relative;
padding-bottom: 19px; /* footer height */
margin-left:15%;
width:100%;

}
header {
background-color: #EFEFEF;
}

</style>


</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;position:relative;background-repeat:repeat;">

	
	<div class="groupCard--photo loading nametag-photo " style="background-image: url(../resources/img/playground2.jpg); width:100%; height:300px; position:relative;background-position: 50% 60%;background-size: cover;">
	
	</div>
	
	<div class="row" >
	
	<div align ="center" style="margin-top:2%;" >
	
		<div><h2>New groups!</h2></div>
		<div>
			<table border="0" width="70%">
				<tr>
					<c:forEach items="${newMeetingList }" var="list">
						<td>
							<a href="/meeting/get?mno=${list.mno }" >
							<div class="groupCard--photo loading nametag-photo " style="background-image: url(../resources/img/${list.idValue}_${list.originalFile}); width:300px; height:150px; position:relative;">
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
		</div>
		<br><br>
		
		<div><h2>Hot groups!</h2></div>
		
			<table border="0" width="70%">
				<tr>
					<c:forEach items="${hotMeetingList }" var="list">
						<td>
							<div class="groupCard--photo loading nametag-photo " style="background-image: url(../resources/img/${list.idValue}_${list.originalFile}); width:300px; height:150px; position:relative;">
					 		<div class="groupCard--gradient"></div>
			                            
					 		<div class="groupCard--content nametag-photo-name groupCard--title" style="position:absolute;  left:10px;bottom:0px;">
			
			                      <h6 style="color:white; font-family:nanumpenscript;"class="padding-none inline-block loading" >${list.mname}</h6>
			                      
							</div>
			
								
							</div>
						</td>
					</c:forEach>
				</tr>
			</table>
		
		
		</div>
	</div>
	


	
<%@ include file = "includes/footer.jsp" %>
</body>

</html>