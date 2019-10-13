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

</style>

<script>
$(document).ready(function() {

	myList1();
    
    myList2();
    
//    $(window).scroll(function(){
//        var position = $(document).scrollTop();
//        $("#left").css('top',  position ); 
//        
// 	});
    
//    $("#send").click(function(e){
//    	e.preventDefault();
    	
//    	var district = $("select[name=district]").val();
//    	var category = $("select[name=category]").val();
//    	var search = $("#search").val();
    	   	
//    	alert(district);
//    	alert(category);
 //   	alert(search);
    	
//    });
});
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
		,
		error: function(request, status, error){
			alert(error);
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


</script>
</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;position:relative;background-repeat:repeat;">

<div class="row" >

	<div class = "col-sm-4" id="left">
		<div align="center" style="margin: 5% 0% 4% 15%;">
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
		<h2 align="center">Meet Up Now! </h2>
		
		<br>
	
				<table style="margin-left:6%; width:90%;">
					<form action="/meeting/list" id="isForm" method="get" >
					<tr>
						<td width="5%">
							 <select class="form-control" id="district" name = "district" style="width:110px;height:35px;">
							  	<option value="zz">전체지역</option>
							    <option value="서울" <c:if test="${cri.district eq '서울'}">selected</c:if>>서울</option>
							    <option value="경기" <c:if test="${cri.district eq '경기'}">selected</c:if>>경기</option>
							    <option value="인천" <c:if test="${cri.district eq '인천'}">selected</c:if>>인천</option>
							    <option value="대전" <c:if test="${cri.district eq '대전'}">selected</c:if>>대전</option>
							    <option value="대구" <c:if test="${cri.district eq '대구'}">selected</c:if>>대구</option>
							    <option value="광주" <c:if test="${cri.district eq '광주'}">selected</c:if>>광주</option>
							    <option value="부산" <c:if test="${cri.district eq '부산'}">selected</c:if>>부산</option>
							    <option value="제주" <c:if test="${cri.district eq '제주'}">selected</c:if>>제주</option>
							    <option value="기타" <c:if test="${cri.district eq '기타'}">selected</c:if>>기타</option>
							  </select>
						</td>
						<td width="5%">
							<select class="form-control" id="category" name = "category" style="width:120px;height:35px;">
							  	<option value="zz">-category-</option>
							    <option value="IT과학" <c:if test="${cri.category eq 'IT과학'}">selected</c:if>>IT & 과학</option>
							    <option value="운동" <c:if test="${cri.category eq '운동'}">selected</c:if>>운동</option>
							    <option value="동물" <c:if test="${cri.category eq '동물'}">selected</c:if>>동물</option>
							    <option value="종교" <c:if test="${cri.category eq '종교'}">selected</c:if>>종교</option>
							    <option value="음식" <c:if test="${cri.category eq '음식'}">selected</c:if>>음식</option>
							    <option value="공연영화" <c:if test="${cri.category eq '공연영화'}">selected</c:if>>공연 & 영화</option>
							    <option value="책" <c:if test="${cri.category eq '책'}">selected</c:if>>책</option>
							    <option value="비즈니스" <c:if test="${cri.category eq '비즈니스'}">selected</c:if>>비즈니스</option>
							    <option value="봉사" <c:if test="${cri.category eq '봉사'}">selected</c:if>>봉사</option>
							    <option value="언어" <c:if test="${cri.category eq '언어'}">selected</c:if>>언어</option>
							    <option value="예술공예" <c:if test="${cri.category eq '예술공예'}">selected</c:if>>예술 & 공예</option>
							    <option value="음악" <c:if test="${cri.category eq '음악'}">selected</c:if>>음악</option>
							 </select>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2"><input class="form-control" name = "search" style="width:240px;" maxlength="15" <c:if test="${cri.search ne 'zz'}">value='${cri.search}'</c:if>/></td>
						<td><button class="btn btn-dark btn-sm" id="send" >Search</button></td>
						<td width="38%" style="float:right;"><button type="button" class="btn btn-info" onclick="location.href='/meeting/new'" >New!</button></td>
					</tr>
					</form>
				</table>
				
			
			
		<br>
		<c:if test="${empty list }"><div align="center"><h3>-- 조건에 맞는 그룹이 없습니다 --</h3></div></c:if>
		
		<table align="center" class="table-responsive" border="0" cellpadding="10" cellspacing="0" style="text-align:center; width:90%;" > 
		<c:set var="i" value="0" /> 
		<c:set var="j" value="3" /> 
		
		
		<c:forEach items="${list }" var="list"> 
		
		<c:if test="${i%j == 0 }"> 
		<tr> 
		</c:if>
		 <td>
			
		 	<a href="/meeting/get?mno=${list.mno }" >
		 	<div class="groupCard--photo loading nametag-photo " style= "background-image: url(../resources/img/${list.idValue}_${list.originalFile}); width:300px; height:150px; position:relative;">
		 		<div class="groupCard--gradient"></div>
                            
		 		<div class="groupCard--content nametag-photo-name groupCard--title" style="position:absolute;  left:10px;bottom:0px;">

                      <h6 style="color:white; font-family:nanumpenscript;"class="padding-none inline-block loading" itemprop="name">${list.mname}</h6>
                      
				</div>
			</div>
			 <p class="small ellipsize">${list.location}</p>
			 </a>
		 </td> 
		 <c:if test="${i%j == j-1 }"> 
		 </tr> 
		 </c:if> 
		 <c:set var="i" value="${i+1 }" /> 
		 </c:forEach> 
		 </table>
		 
		 
	
	
	  
	  
   	 </div>
   	
</div>
<%@ include file = "../includes/footer.jsp" %>
</body>

</html>
