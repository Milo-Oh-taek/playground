<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	h3{color:blue;}
	img{width:300px height:200px;}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	$(document).ready(function(){

		var area = $('input[name="area"]:checked');
		
		
		$.ajax({        
		    url: 'PublicData.do',
		    type: 'get',
		    data: area,
		    dataType: 'json',
		    success: function(data){
		  	  console.log(data);
		
		        var myItem = data.response.body.items.item;
		         
		        for(var i=0; myItem.length; i++){
		            var output = '';
		            console.log(myItem.length);
		            output += '<h3> #'+ i +'</h3>';
		            output += '<h4>'+ '<img src = ' + myItem[i].firstimage2 + ' width = "300" height="200"</h4>';
		            output += '<h4>'+myItem[i].addr1+'</h4>';
		            output += '<h4>'+myItem[i].title+'</h4>';
		            output += '<h4>'+myItem[i].tel+'</h4>';
		            document.getElementById("main").innerHTML += output;
		        }
		    },
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
		  	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
			} 
		});
	});
	
	

</script>
</head>
<body>

<h2>지역</h2>
<input type="radio" name = "area" id="seoul" value = "1" checked />서울
<input type="radio" name = "area" id="busan" value = "2" />인천
<input type="radio" name = "area" id="a" value = "3" />대전
<input type="radio" name = "area" id="b" value = "4" />대구
<input type="radio" name = "area" id="c" value = "5" />광주
<input type="radio" name = "area" id="c" value = "6" />부산


<div id = "main" width = "700" height = "2000">

</div>

<script>

$('input[name="area"]').change(function(){
	
	document.getElementById("main").innerHTML = null;
	
	var area = $('input[name="area"]:checked');
	
	$.ajax({        
	    url: 'PublicData.do',
	    type: 'get',
	    data: area,
	    dataType: 'json',
	    success: function(data){
	  	  console.log(data);
	
	        var myItem = data.response.body.items.item;
	         
	        for(var i=0; myItem.length; i++){
	            var output = '';
	            console.log(myItem.length);
	            output += '<h3> #' + i + '</h3>';
	            output += '<h4>'+ '<img src = ' + myItem[i].firstimage2 + ' width = "300" height="200"</h4>';
	            output += '<h4>'+myItem[i].addr1+'</h4>';
	            output += '<h4>'+myItem[i].title+'</h4>';
	            output += '<h4>'+myItem[i].tel+'</h4>';
	            document.getElementById("main").innerHTML += output;
	        }
	    },
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
	  	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
		} 
	});
	
});
</script>


</body>
</html>