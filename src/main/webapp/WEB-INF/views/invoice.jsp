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
    }
</style>
</head>
<body>

<div class="invoice">
    <h2>거&nbsp;&nbsp;&nbsp;래&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;세&nbsp;&nbsp;&nbsp;서&nbsp;&nbsp;&nbsp;( 공급자 )</h2>
    
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
                    <th>적요</th>
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
                <tr>
                    <td colspan="2" id="total">합계</td>
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
    <button type="button" class="btn btn-primary">저장</button>
    <button type="button" class="btn btn-secondary">출력</button>
</div>
</body>
</html>
