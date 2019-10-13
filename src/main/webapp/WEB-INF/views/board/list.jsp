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



.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}
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
	var msg = '<c:out value="${msg}"/>';
	if(msg != ""){alert(msg);}
	
	bestList();
	
	$("#btnSearch").on("click", function(e){
		

		var searchForm = $("#searchForm");
		var keyWord = searchForm.find("input[name='keyword']").val();
				
		if(keyWord == null || keyWord ==''){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='page']").val("1");
		e.preventDefault();
		
		searchForm.submit();
		
	});
	
});

function bestList(){
	
	$.ajax({
		type: "get",
		url:"/board/bestList",
		success: function(result){
			
			var output = '<table class="table table-bordered "cellpadding="0" cellspacing="0" style="width:100%;"><thead class="thead-dark">';
				output += '<tr><th width="75%">제목</th><th>조회</th><th>추천</th></tr>';
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
</head>
<body style="background-image:url(../resources/img/패턴.jpg);background-size:cover;height:100%;position:relative;background-repeat:repeat;">
<div class="row">

	<div class = "col-sm-4" align="center">
			<div align="center" style="margin: 15% 0 4% 15%;">
				<h3>주간 인기글</h3>
				<br>
				<div id="list"></div>
						
			</div>
	</div>

	<div class="col-sm-8 " style=margin-right:0;>
	<br><br><br>
		<div style="margin-left:10%;"><h2>Free Board </h2></div>
		
	  <table class="table thead-dark table-striped " align="center" style="width:80%;">
		  <thead class="thead-dark">
		  <tr>
		  <th>글번호</th>
		  <th>제목</th>
		  <th>글쓴이</th>
		  <th>작성일자</th>
		  <th>조회</th>
		  <th>추천</th>
		  </tr>
		   </thead>
		  
		  <c:forEach items="${boardList }" var="board">
		  <tr>
		  <td><c:out value="${board.bno }" /></td>
		  <td><a href="get?bno=${board.bno}" > <c:out value="${board.title }" />[<c:out value="${board.replyCnt }" />] </a></td>
		  <td><c:out value="${board.writer }" /></td>
		  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
		  <td><c:out value="${board.viewCnt }" /></td>
		  <td><c:out value="${board.likeCnt }" /></td>
		  </tr>
		  </c:forEach>
	  
	  </table>
	  <div align="right" style="margin-right:10%;"><button type="button" class="btn btn-primary" onclick="location.href='new'">글쓰기</button></div>
	  		<!--  pagination -->
  			<div align = "center" >
                   	<ul class = "pagination justify-content-center ">
                   		<c:if test="${pageMaker.prev }">
                   			<li  class="page-item"><a href="/board/list?searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword }&page=${pageMaker.startPage -1 }">Previous</a></li>
                   		</c:if>
                   		
                   		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                   			<li  class="page-item"><a href= '<c:url value="/board/list?searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword }&page=${num }" />'> ${num }</a></li>
                   		</c:forEach>
                   		
                   		<c:if test="${pageMaker.next }">
                   			<li  class="page-item"><a href="/board/list?searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword }&page=${pageMaker.endPage +1 }">Next</a></li>
                   		</c:if>
                   		
                   	</ul>
             </div>
	  		<!--  pagination End -->
	  
	  		<!--  search -->
	  		<div align="center" >
		
			<form id='searchForm' action="/board/list" method='get'>
			<div  style="padding-right:10px; display: inline-block;" align="center">
				
				<select class="form-control" name="searchType" id="searchType" >

					<option value="title">제목</option>

					<option value="Content">본문</option>

					<option value="writer">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px; display: inline-block; width:40%;">

				<input type="text" class="form-control "maxlength="30" name="keyword" id="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
				<input type="hidden" name='page' value= '<c:out value= "${pageMaker.cri.page }"/>' />
				<input type="hidden" name='amount' value= '<c:out value= "${pageMaker.cri.amount }"/>' />
			</div>

			<div style="display: inline-block;">

				<button class="btn btn-sm btn-dark" name="btnSearch" id="btnSearch" >검색</button>

			</div>
			</form>
			<!-- Search End -->
	  
	  
   			 </div>
</div>
</div>
<%@ include file = "../includes/footer.jsp" %>
</body>

</html>