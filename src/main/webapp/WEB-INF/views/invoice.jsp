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
        margin-top: 15px;
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
                    <th>공급가액</th>
                    <th>단가</th>
                    <th>특이사항</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>
<div class="button">
    <input type="button" class="btn" value="출력" onclick = "printPage()">
</div>
<script>

document.addEventListener("DOMContentLoaded", function() {
	const urlParams = new URLSearchParams(window.location.search);
    const o_no = urlParams.get('o_no'); // 쿼리 파라미터에서 'o_no' 값을 가져옴
    
	fetchOListDetail(o_no);
});

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


//주문 상세 불러오기(명세서에 넣기)
async function fetchOListDetail(o_no){
	try {
		const response = await fetch("/api/getOListDetail?o_no=" + o_no, {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });
		
		// 응답을 JSON으로 파싱
        const data = await response.json();
        console.log(data);
		updateTable(data);
		
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}



//테이블 업데이트 함수
function updateTable(data) {
    const tbody = document.querySelector(".items tbody");

    // 기존의 <tr>를 모두 제거
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    // 데이터 기반으로 <tr> 생성 및 추가
    let totalQuantity = 0;
    let totalSupplyAmount = 0;
    let totalUnitPrice = 0;

    data.forEach(function(item) {
        const tr = document.createElement("tr");

        //품명
        const itemName = document.createElement("td");
        itemName.textContent = item.p_name || '';
        tr.appendChild(itemName);

        //수량
        const o_num = document.createElement("td");
        const quantity = parseInt(item.o_num) || 0; // 수량은 정수형으로 변환
        o_num.textContent = quantity;
        tr.appendChild(o_num);

        //공급액
        const totalPrice = document.createElement("td");
        totalPrice.textContent = item.o_total || '';
        tr.appendChild(totalPrice);
        
        
        //단가
        const o_price = document.createElement("td");
        // 단가는 공급액을 수량으로 나누어 계산
        const supplyAmount = parseInt(item.o_total.replace(/,/g, '') || 0); // 공급액에서 쉼표 제거 후 정수형으로 변환
        const unitPrice = quantity > 0 ? (supplyAmount / quantity).toLocaleString() : 0;
        o_price.textContent = unitPrice;
        tr.appendChild(o_price);


        //특이사항
        const significant = document.createElement("td");
        tr.appendChild(significant);
        
        tbody.appendChild(tr);

        // 합계 계산
        totalQuantity += quantity;
        totalSupplyAmount += supplyAmount;
        // 단가는 평균 단가를 계산할 때 사용될 수 있으므로,
        // 현재로서는 합계에 포함하지 않고 `totalUnitPrice`로 기록
        totalUnitPrice = (totalSupplyAmount / totalQuantity) || 0;
    });

 // 평균 단가 계산
    const averageUnitPrice = totalQuantity > 0 ? (totalSupplyAmount / totalQuantity).toLocaleString() : 0;

    // 합계 행 추가
    const totalRow = document.createElement("tr");
    totalRow.id = "total";

    const totalTh = document.createElement("th");
    totalTh.textContent = "합계";
    totalRow.appendChild(totalTh);

    //물품 총 수량
    const totalQuantityTd = document.createElement("td");
    totalQuantityTd.textContent = totalQuantity;
    totalRow.appendChild(totalQuantityTd);

    //물품 합계 금액
    const totalSupplyAmountTd = document.createElement("td");
    totalSupplyAmountTd.textContent = totalSupplyAmount.toLocaleString();
    totalRow.appendChild(totalSupplyAmountTd);

    //물품 평균 단가
    const averageUnitPriceTd = document.createElement("td");
    averageUnitPriceTd.innerHTML = "<strong>평균 단가:</strong> "+averageUnitPrice;
    totalRow.appendChild(averageUnitPriceTd);
    
    const emptyTd2 = document.createElement("td");
    totalRow.appendChild(emptyTd2);

    tbody.appendChild(totalRow);
}
</script>
</body>
</html>
