<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(document).ready(function() {
	$.getJSON('userJson.jsp', function(data) {
		$.each(data, function(key, value) {
			var str = '<h4>' + value.id +" / "+value.pw+" / "+value.name+" / "+value.birth+" / "+value.gender+" / "+value.phone+" / "+value.email+'</h4>';
			$('body').append(str);
		});
	});
});

</script>
</head>
<body>

</body>
</html>