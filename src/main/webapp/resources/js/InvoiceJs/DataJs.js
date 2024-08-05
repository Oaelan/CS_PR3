/**
 * 데이터 사용 스크립트
 * 
 */

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