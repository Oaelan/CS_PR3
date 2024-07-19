<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
div.create {
	width: 800px;
	text-align: center;
	padding: 30px;
	border-bottom: 1px solid #ccc;
	margin: auto;
}

table {
	height: 500px;
	width: 900px;
	border-top: 3px solid black;
	margin-right: auto;
	margin-left: auto;
}

td {
	border-bottom: 1px dotted black;
}

caption {
	text-align: left;
}

.col1 {
	background-color: #e8e8e8;
	padding: 10px;
	text-align: right;
	font-weight: bold;
	font-size: 0.8em;
}

.col2 {
	text-align: left;
	padding: 5px;
}

.but1 {
	height: 25px;
	width: 80px;
	color: white;
	background-color: black;
	border: none;
	border-radius: 15px;
}

.but2 {
	height: 27px;
	width: 120px;
	color: white;
	background-color: black;
	border: none;
	border-radius: 15px;
}

.but3 {
	height: 35px;
	width: 150px;
	background-color: white;
	border: 2px solid black;
}

.but4 {
	height: 35px;
	width: 150px;
	background-color: white;
	border: 2px solid black;
}

.but1:hover {
	background-color: #b9b9b9;
	color: black;
	border: 1px solid black;
}

.but2:hover {
	background-color: #b9b9b9;
	color: black;
	border: 1px solid black;
}

.but3:hover {
	background-color: black;
	color: white;
	border: 2px solid black;
}

.but4:hover {
	background-color: black;
	color: white;
	border: 2px solid black;
}

p {
	font-size: 0.7em;
}

.g {
	font-size: 0.7em;
}

.c {
	font-size: 0.7em;
}

.a {
	font-size: 0.7em;
}

.num {
	color: red;
}

.error-message {
	color: red;
	font-size: 0.8em;
	margin-top: 5px;
}
</style>
</head>
<body>
	<form id="registerForm" method="post" action="">
    <div class="container">
        <div class="insert">
            <table>
                <caption>
                	<h2>회원가입 양식</h2>
                </caption>
                <tr>
                    <td class="col1">이름</td>
                    <td class="col2">
                        <input type="text" id="u_name" name="u_name" maxlength="5" required> 
                        <span id="nameError" class="error-message"></span>
                    </td>
                </tr>
                <tr>
                    <td class="col1">아이디</td>
                    <td class="col2">
                        <input type="text" id="u_id" name="u_id" maxlength="20" required> 
                        <input class='but1' type="button" value="중복확인" onclick=""> 
                        <span id="idError" class="error-message"></span>
                    </td>
                </tr>
                <tr>
                    <td class="col1">비밀번호</td>
                    <td class="col2">
                        <input type="password" id="u_pw" name="u_pw" maxlength="20" required>
                        <p style="font-size: 15px;">
                            	※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 8 ~ 25자리</span>로 입력이 가능합니다.
                        </p> 
                        <span id="pwdError" class="error-message"></span>
                    </td>
                </tr>
                <tr>
                    <td class="col1">비밀번호 확인</td>
                    <td class="col2">
                        <input type="password" id="u_pwCheck" name="u_pwCheck" maxlength="20" required> 
                        <span id="pwdCheckError" class="error-message"></span>
                    </td>
                </tr>
                <tr>
                    <td class="col1">이메일</td>
                    <td class="col2">
                        <input type="text" name="mailid" required>
                        <span class="a">@</span> 
                        <input type="text" name="email" required>
                        <select name="mailslc">
                            <option value="self" selected>직접입력</option>
                            <option value="naver">naver.com</option>
                            <option value="gm">gmail.com</option>
                            <option value="da">daum.com</option>
                            <option value="yah">yahoo.com</option>
                        </select> 
                        <input class='but2' type="button" value="이메일 중복확인" onclick="">
                        <span id="emailError" class="error-message"></span>
                    </td>
                </tr>
                <tr>
                    <td class="col1">주소</td>
                    <td class="col2"><input type="text" name="u_address" required></td>
                </tr>
                <tr>
                    <td class="col1">사업자 번호</td>
                    <td class="col2"><input type="text" name="u_no" required></td>
                </tr>
            </table>
        </div>
        <div class="create">
            <input class="but3" type="button" value="가입취소" onclick=""> 
            <input class="but4" type="submit" value="회원가입" onclick="formCheck()">
        </div>
    </div>
</form>

	<script>
	// 페이지의 모든 요소가 로드된 후에 실행될 함수
	window.onload = function() {
	    // 사용자 ID 검증
	    var userId = document.getElementById("u_id");
	    var idLabel = document.getElementById("idError"); 
	    idLabel.textContent = ".";
	    idLabel.style.color = "white";
	    userId.addEventListener("input", validateUserId);
	
	    function validateUserId() {
	        var userIdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{7,20}$/;
	        if (userId.value.match(userIdPattern)) {
	            idLabel.textContent = "사용 가능한 아이디입니다.";
	            idLabel.style.color = "green";
	            return true;
	        } else {
	            idLabel.textContent = "사용자 ID는 영문자와 숫자를 조합하여 7-20자여야 합니다.";
	            idLabel.style.color = "red";
	            return false;
	        }
	    }
	
	    // 비밀번호 검증
	    let password = document.getElementById("u_pw");
	    let pwLabel = document.getElementById("pwdError");
	    pwLabel.textContent = ".";
	    pwLabel.style.color = "white";
	    password.addEventListener("input", validatePassword);
	    password.addEventListener("input", validatePasswordConfirmation);
	
	
	    function validatePassword() {
	        var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/;
	        if (password.value.match(passwordPattern)) {
	            pwLabel.textContent = "사용 가능한 비밀번호입니다.";
	            pwLabel.style.color = "green";
	            return true;
	        } else {
	            pwLabel.textContent = "비밀번호는 영문자, 숫자, 특수문자를 조합하여 8-25자여야 합니다.";
	            pwLabel.style.color = "red";
	            return false;
	        }
	    }
	
	    // 비밀번호 확인 함수
	    let pwcheck = document.getElementById("u_pwCheck");
	    let confirmLabel = document.getElementById("pwdCheckError");
	    confirmLabel.textContent = ".";
	    confirmLabel.style.color = "white";
	    pwcheck.addEventListener("input", validatePasswordConfirmation);
	
	    function validatePasswordConfirmation() {
	        var passwordValue = document.getElementById("u_pw").value; 
	        var confirmPassword = pwcheck.value; 
	        if (passwordValue === confirmPassword) {
	            confirmLabel.textContent = "비밀번호가 일치합니다.";
	            confirmLabel.style.color = "green";
	            return true;
	        } else {
	            confirmLabel.textContent = "비밀번호가 일치하지 않습니다.";
	            confirmLabel.style.color = "red";
	            return false;
	        }
	    }
	
	    // 이름 검증
	    let name = document.getElementById("u_name");
	    let nameLabel = document.getElementById("nameError"); 
	    nameLabel.textContent = ".";
	    nameLabel.style.color = "white";
	    name.addEventListener("input", validateName);
	
	    function validateName() {
	        var namePattern = /^[가-힣]{2,6}$/;
	        if (name.value.match(namePattern)) {
	            nameLabel.textContent = "사용할 수 있는 이름입니다.";
	            nameLabel.style.color = "green";
	            return true;
	        } else {
	            nameLabel.textContent = "이름은 한글만 2-6자여야 합니다.";
	            nameLabel.style.color = "red";
	            return false;
	        }
	    }
	
	    // 폼 제출 검증
	    let form = document.getElementById("registerForm"); 
	    form.addEventListener("submit", (event) => {
	        let isUserIdValid = validateUserId();
	        let isPasswordValid = validatePassword();
	        let isPasswordConfirmationValid = validatePasswordConfirmation();
	        let isNameValid = validateName();
	
	        if (!isUserIdValid || !isPasswordValid || !isPasswordConfirmationValid || !isNameValid) {
	            event.preventDefault();
	            alert("필드를 올바르게 입력해주세요.");
	        }
	    });
	};
	</script>
</body>
</html>
