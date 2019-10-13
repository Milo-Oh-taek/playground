<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file = "../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		


 <meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	bestList();
	
	$("#goList").click(function(e){
		var ask = "글쓰기를 멈추고 목록으로 가시겠습니까?";
		if(confirm(ask)){
			location.href='list';
		}else{
			return;
		}
	})
})
function bestList(){
	
	$.ajax({
		type: "get",
		url:"/board/bestList",
		success: function(result){
			
			var output = '<table class="table table-bordered " style="width:95%;"><thead class="thead-dark">';
				output += '<tr><th>제목</th><th>조회</th><th>추천</th></tr>';
			for(var i=0,leng=result.length||0; i<leng; i++){
				
				var title = result[i].title;
				var viewCnt = result[i].viewCnt;
				var like = result[i].likeCnt;
				var bno = result[i].bno;
				
				
				output += '<tr><td><a href="get?bno='+bno+'"">'+title+'</a></td>'+'<td>'+viewCnt+'</td>'+'<td>'+like+'</td></tr>';
			}
			
			output += '</thead></table>';
			$("#list").html(output);
		}
	})
}
</script>
<style>
a:link {color: black;}
a:visited{color: black;}
a:hover{color: black;}
table th{
	font-size:14px;
}
table td{
	font-size:13px;
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
</style>
</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;height:100%;position:relative;background-repeat:repeat;">


<div class="row">

	<div class = "col-sm-4">
		<div align="center" style="margin: 15% 0% 4% 15%;">
			<h3>주간 인기글</h3>
			<br>
			<div id="list"></div>
						
		</div>
	</div>

	<div class="col-sm-8 " style="margin-right:auto;">
		<form id = "isForm" action = "/board/modify" method="post">
			<br><br><br>
				<div style="margin-left:10%;"><h2>Free Board </h2></div>
			  <table id="table" align="center" class="table table-bordered"  style="width:80%;">
				  
				  <thead class="thead-light">
				  <tr>
					<th width="15%" style="vertical-align:middle;">Title</th>
					<td colspan="3"><input class="form-control" name = "title" value = "<c:out value='${boardGet.title }' />"></td>
					</tr>
				  
				 
					<tr>
					<th style="vertical-align:middle;">writer</th>
					<td colspan="3"><input class="form-control" name = "writer" readonly="readonly" value = "<c:out value='${boardGet.writer }' />"></td>
					</tr>
					
					<tr>
					<th style="vertical-align:middle;">register date</th>
					<td><input class="form-control" readonly="readonly" value = "<fmt:formatDate value='${boardGet.regdate }'  /> "></td>
					<th style="vertical-align:middle;">update date</th>
					<td><input class="form-control" readonly="readonly" value = "<fmt:formatDate value='${boardGet.updatedate }'  />"> </td>
					</tr>
					
					<tr>
					<th style="vertical-align:middle;">content</th>
					<td colspan="3"><textarea class="form-control" name = "content" style="height:350px;"><c:out value="${boardGet.content }" /></textarea></td>
					</tr>
					</thead>
			  </table>
			  <input type="hidden" name = "bno" value='<c:out value="${boardGet.bno }" />' />
			  
				
				<div align="center">
				<button class="btn btn-info" type="button" id="goList">list</button>
				<button type="submit" class="btn btn-warning">modify</button>
	  			</div>
	 	</form>
    </div>
</div>

<%@ include file = "../includes/footer.jsp" %>
</body>

</html>