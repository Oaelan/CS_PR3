<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 전용 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            box-sizing: border-box;
            width: 100%;
            padding: 0;
            margin: 0;
            font-family: 나눔고딕;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            width: 100%;
            height: 100px;
            border-bottom: 1px solid lightgray;
        }
        .menu {
            background-color: white;
            padding: 20px;
            height: 60px;
            border-bottom: 1px solid lightgray;
            display: flex;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
        }

        .menu ul {
            display: flex;
            padding: 0;
            list-style: none;
            justify-content: center;
            align-items: center;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 0px;
        }
        .menu li {
            display: inline;
            margin: 0 120px;
            font-size: 18px;
            position: relative;
            font-family: 나눔고딕;
            box-sizing: border-box;
        }

        .menu a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
        <div class="header">
            <h2>관리자 전용 페이지</h2>
        </div>
        <div class="menu">
            <ul>
                <li><a href="/productRegister">제품등록</a></li>
                <li><a href="/OList">주문내역</a></li>
                <li><a href="/ship">출하관리</a></li>
                <li><a href="/dlvS">배송상태</a></li>
            </ul>
        </div>
</body>
</html>