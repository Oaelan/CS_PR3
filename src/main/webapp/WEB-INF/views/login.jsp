<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/login.css" rel="stylesheet">

</head>
<body>
	<header> HEADER </header>
	<form action="/login" method="post">
		<table>
			<tr class="loginInput">
				<td>아이디</td>
				<td><input type="text" id="u_id" name="u_id" placeholder="아이디"></td>
			</tr>
			<tr class="loginInput">
				<td>비밀번호</td>
				<td><input type="password" id="u_pw" name="u_pw" placeholder="비밀번호"></td>
			</tr>
			<tr class="loginInput">
				<td colspan="2"><input id="loginB" type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>