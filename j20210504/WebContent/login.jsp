<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="wrap">
        <div class="login">
            <h2>로그인</h2>
            <div class="login_id">
            <form action="loginPro.do">
                <h4>아이디</h4>
                <input type="text" name="id" placeholder="아이디를 입력해주세요" required="required">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="password" placeholder="비밀번호를 입력해 주세요" required="required">
            </div>
            <div class="submit">
                <input type="submit" value="로그인">
            </form>
            </div>
        </div>
    </div>
</body>
</html>