<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>거래명세서</title>
<style>
    .invoice {
        width: 800px;
        height: 1000px;
        background: white;
        margin: 20px auto;
        border: 1px solid #cccccc;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .invoice h2 {
        text-align: center;
    }
    .invoice .details {
        display: flex;
        justify-content: space-between;
        width: 100%;
        margin-top: 20px;
    }
    .invoice .details table {
        width: calc(50% - 10px); /* 각 테이블의 너비를 50%로 설정하고 간격을 위해 10px을 뺍니다 */
        border-collapse: collapse;
    }
    .invoice .items {
        width: 100%;
    }
    .invoice .items table {
        width: 100%;
        border-collapse: collapse;
    }
    .invoice table th, .invoice table td {
        border: 1px solid #dddddd;
        padding: 8px;
        text-align: center;
    }
    .invoice table th {
        background-color: #f2f2f2;
    }
    .invoice table td {
        vertical-align: middle;
    }
    .invoice .total {
        align-self: flex-start;
    }

    .invoice .total p {
        margin-bottom: 0px;
    }

    input {
        border: none;
        display: inline;
        width: 50px;
        text-align: right;
        font-size: 16px;
    }

    .items table td {
        height: 20px;
    }

    .invoice .date {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        width: 380px;
        padding-left: 10px;
    }
    .invoice #date, .invoice #company{
        margin: 30px 0;
        border-bottom: 1px solid #cccccc;
        padding-bottom: 20px;
        width: 100%;
        text-align: center;
    }
    
    .button {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    gap: 30px;
	    margin-top: 20px;
	    margin-bottom: 100px;
    }
    
	.btn {
    	color: white;
   		width: 100px;
   		height: 30px;
   		border: none;
   		text-align: center;
   		border-radius: 5px;
   		font-family: 나눔고딕;
   		background-color: #6c757d;
    }
    

</style>
</head>
<body>

<div class="invoice">
    <h2>거&nbsp;&nbsp;&nbsp;래&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;세&nbsp;&nbsp;&nbsp;서&nbsp;&nbsp;&nbsp;</h2>
    
    <div class="details">
        <div class="date">
            <p id="date">2024-07-24</p>
            <p id="company">(주)홍길동컴퍼니 귀하</p>
        </div>
        <table>
            <tr>
                <td rowspan="6">공급자</td>
            </tr>
            <tr>
                <td>상호</td>
                <td colspan="3">(주)홍길동컴퍼니</td>
            </tr>
            <tr>
                <td>TEL</td>
                <td>010-1234-5678</td>
                <td>성명</td>
                <td>홍길동</td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="3">서울특별시 강남구</td>
            </tr>
            <tr>
                <td>업태</td>
                <td>도/소매</td>
                <td>종목</td>
                <td>약품</td>
            </tr>
            <tr>
                <td>등록번호</td>
                <td colspan="3">123-45-67890</td>
            </tr>
        </table>
    </div>
    
    <div class="items">
        <table>
            <thead>
                <tr>
                    <th>품명</th>
                    <th>수량</th>
                    <th>단가</th>
                    <th>공급가액</th>
                    <th>생산자</th>
                    <th>특이사항</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>아스피린</td>
                    <td>1245</td>
                    <td>3,000</td>
                    <td>3,735,000</td>
                    <td>홍길동 (12345678)</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr id="total">
                    <th>합계</th>
                    <td>1245</td>
                    <td>3,000</td>
                    <td>3,735,000</td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="button">
    <input type="button" class="btn" value="출력" onclick = "printPage()">
</div>
<script>
//페이지 인쇄 함수
function printPage() {
	// 버튼을 숨김
    var btns = document.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].style.display = 'none';
    } 

    // 버튼 빼고 인쇄
    window.print();

    // 인쇄 후 버튼을 다시 보이게
    for (var i = 0; i < btns.length; i++) {
        btns[i].style.display = '';
    }
}


async function fetchOListDetail(){
	try {
		const response = await fetch("/api/getOListDetail", {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });
		
		// 응답을 JSON으로 파싱
        const data = await response.json();
        return data;
		
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}
</script>
</body>
</html>
