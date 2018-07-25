<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function(){
		$.ajax({
			url : 'userXml.jsp',
			success : function(data){
				$(data).find('user').each(function(){
					var id=$(this).find('id').text();
					var pw=$(this).find('pw').text();
					var name=$(this).find('name').text();
					var birth=$(this).find('birth').text();
					var gender=$(this).find('gender').text();
					var phone=$(this).find('phone').text();
					var email=$(this).find('email').text();
					$('<h4></h4>').text(id+" / "+pw+" / "+name+" / "+birth+" / "+gender+" / "+phone+" / "+email)
					.appendTo('table');
				})
			}
		})
	})

</script>
</head>
<body>
<table>

</table>
</body>
</html>