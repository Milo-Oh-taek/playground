<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file = "../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 
<title>Insert title here</title>

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

<script>


$(document).ready(function(){
	
	listReply();
	
	getLike();
	
	bestList();
	
	$("#addReply").on("click",function(){
		
		if(document.getElementById("reply").value !="" && document.getElementById("reply").value != null){
			
			var reply = $("#reply").val();
			var bno = "${boardGet.bno}";
			var replyer = "나";
			var param = "reply="+reply+"&bno="+bno+"&replyer="+replyer;
			
			$.ajax({
				type:"post",
				url: "/reply/new",
				data: param,
				success: function(){
					alert("댓글이 등록되었습니다.");
					document.getElementById("reply").value = "";
					listReply();
				}
			});
				
		}else{
		
			alert("내용을 입력하세요");
			return false;
		
		}
		
	});
	
	
	
	$("#delete").on("click",function(e){
		
		e.preventDefault();
		
		var delConfirm = confirm("삭제하시겠습니까?");
		
		if(delConfirm){
			
			$("#isForm").submit();
		
		}else{
			
		}
	
	});
	
	$("#like").on("click",function(e){
		
		var bno = ${boardGet.bno};
		
		$.ajax({
			type:"get",
			url: "${path}/board/like?bno="+bno,
			success: function(){
				getLike();
				alert("liked");
				
			}
		
		})
	});
	
	$("#unlike").on("click",function(e){
		var bno = ${boardGet.bno};
		
		$.ajax({
			type:"get",
			url: "${path}/board/unlike?bno="+bno,
			success: function(){
				alert("unliked");
				getLike();
				
			}
		
		})
		
	});
	
	$('#reply').on('keyup', function() {
		if($(this).val().length > 800) {
	alert("글자수는 800자로 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 800));
		}
	});

	
	
	
});
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

function likeChk(){
	var bno = ${boardGet.bno};
	var likeCnt = $("#likeCnt").val();
		
	$.ajax({
		type:"get",
		url: "/board/likeChk?bno="+bno,
		success:function(result){
			if(result != 0){
				$("#like").hide();
				$("#unlike").show();
				$("#unlike").html("추천취소! ("+likeCnt+")");
			}else{
				$("#like").html("추천! ("+likeCnt+")");
				$("#unlike").hide();
				$("#like").show();
			}
		}
	})
}

function getLike(){
	var bno = ${boardGet.bno};
	$.ajax({
		type:"get",
		url: "/board/getLike?bno="+bno,
		success:function(result){
			$("#likeCnt").val(result);
			likeChk();
		}
	})
}



function listReply(){
	
	
	
	$.ajax({
		type: "get",
		contentType: "application/json",
		url: "${path}/reply/list?bno=${boardGet.bno}",
		success: function(result){
			console.log(result);
			
			if(result == null || result.length == 0){
				
				$("#listReply").html("<div align='center'>등록된 댓글이 없습니다</div>");
			
				return;
			};
			
			
			var output = '<table class="table" cellpadding="0" cellspacing="0" id = "table2" style="width:80%; ">';
			
			for(var i=0,leng = result.length|| 0; i<leng; i++){
				
				var replyer = result[i].replyer;
				var rno = result[i].rno;
				var set = rno + "," + replyer;
			
				output += "<tr>";
				output += "<th>" + replyer;
				output += "("+changeDate(result[i].regdate)+")</th><td width='15%' style='float:right;'><a style='cursor:pointer' onclick='replyDel(  \" " + set + "\" );'>delete</a></td>";
				output += "<tr><td colspan='2'>"+result[i].reply +"</td>";
				output += "</tr>";
			};
			output += "</table>";
			$("#listReply").html(output);
		}
	});
}

function changeDate(date){
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth();
	if(month<10) month = '0' + month;
	day = date.getDate();
	if(day<10) day = '0' + day;
	hour = date.getHours();
	if(hour<10) hour = '0' + hour;
	min = date.getMinutes();
	if(min<10) min = '0' + min;
	sec = date.getSeconds();
	if(sec<10) sec = '0' + sec;
	strDate = year+"-"+month+"-"+day+ " "+hour+":"+min+":"+sec;
	return strDate;
}

function replyDel(set){
	
	var username = '${username}';
	var strArray = set.split(',');
	var rno = strArray[0];
	var replyer = strArray[1];
	var ask = confirm("정말 삭제하시겠습니까?");
	
	if (username != replyer){
		alert("본인만 삭제할 수 있습니다.");
	}else if(ask){
		replyDel2(rno);
	}
	
	
	
	//alert(rno);
	//replyDel2(rno);
}

function replyDel2(rno){
	
	$.ajax({
		type:"delete",
		url: "/reply/delete/"+rno,
		
		success: function(){
			alert("댓글이 삭제되었습니다.");
			listReply();
		}
	});

}


</script>
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
		<form action = "/board/delete" id = "isForm" method="post" >
			<br><br><br>
				<div style="margin-left:10%;"><h2>Free Board </h2></div>
			  <table id="table" align="center" class="table table-bordered" style="width:80%;">
				  
				  <thead class="thead-light">
				  <tr>
					<th width="15%" style="vertical-align:middle;">Title</th>
					<td colspan="3"><c:out value='${boardGet.title }' /></td>
					</tr>
				 
					<tr>
					<th style="vertical-align:middle;">writer</th>
					<td colspan="3"><c:out value='${boardGet.writer }' /></td>
					</tr>
					
					<tr>
					<th style="vertical-align:middle;">register</th>
					<td><fmt:formatDate value='${boardGet.regdate }' pattern="yyyy-MM-dd HH:mm:ss" /> </td>
					<th style="vertical-align:middle;">update</th>
					<td><fmt:formatDate value='${boardGet.updatedate }' pattern="yyyy-MM-dd HH:mm:ss" /> </td>
					</tr>
					
					<tr>
					<th style="vertical-align:middle;">content</th>
					<td colspan="3" height="250"><c:out value="${boardGet.content }" /></td>
					</tr>
					</thead>
			  </table>
			  
				<input type = "hidden" name = "bno" value = "<c:out value='${boardGet.bno }' />" />
				
				<div align="right" style="margin-right:10%;">
				<c:if test="${username eq boardGet.writer }">
				<button id = "delete" class="btn btn-danger" type="submit" >Delete</button>
				<button type = "button" class="btn btn-warning" onclick="location.href='modify?bno=${boardGet.bno}'">modify</button>
				</c:if>
				</div>
				<div align="center">
				<button id = "like" id="like" name="like" type= "button" class="btn btn-success" ></button> 
				<button id = "unlike" id="unlike" name="unlike" type= "button" class="btn btn-secondary" ></button> 
				
				<input type="hidden" id = "likeCnt" name="likeCnt" value = "" />
				</div>
				<div align = "right" style="margin-right:10%;">
					<button type = "button" class="btn btn-info" onclick="location.href='list'">list</button>
	  			</div>
	  			<br>
	  			
	  			<!-- 댓글작성 -->
	  			<textarea rows="5" cols="80" id="reply" placeholder="댓글을 작성해주세요" class="form-control" style="width:80%; align:center; margin:auto;"></textarea>
	  			<div align="right"><button type = "button" id = "addReply" class="btn btn-primary btn-sm" style="margin-right:10%;">Comment</button></div>
	  			<br>
	  			
	  			<!-- 댓글목록출력 -->
	  			<div id="listReply" align="center"  ></div>
	  		 </form>
    </div>
   
</div>

<%@ include file = "../includes/footer.jsp" %>
</body>

</html>