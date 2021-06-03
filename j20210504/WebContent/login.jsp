<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="login.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body>
	<div class="login">
		<h1>로그인</h1>
		<form action="loginPro.do">
			<input type="text" name="id" placeholder="아이디를 입력해 주세요" required="required"><p>
			<input type="password" name="password" placeholder="비밀번호를 입력해 주세요" required="required"><p>
			<input type="submit" value="로그인" class="btn btn-primary btn-block btn-large">
		</form>
	</div>
</body>
</html>