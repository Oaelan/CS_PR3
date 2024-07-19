<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/login" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="u_id" name = "u_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" id="u_pw" name = "u_pw"></td>
			</tr>
			<tr>			
				<td><input type="submit" value="로그인"></td>	
			</tr>
		</table>
	</form>
</body>
</html>