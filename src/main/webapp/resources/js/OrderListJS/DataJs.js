/**
 * 
 */

//데이터 가져오는 fetch함수
	async function fetchOrderList() {
	    try {
	        const response = await fetch('/api/getOList', {
	            headers: {
	                'Accept': 'application/json'
	            }
	        });
	
	        // 응답을 JSON으로 파싱
	        const data = await response.json();
	        return data;
	    } catch (error) {
	        console.error('Error fetching data:', error);
	        throw error; // 에러 발생 시 이후 코드가 실행되지 않도록 예외를 던집니다.
	    }
	}

	
	
	
	
	
	//페이지 주문 목록에 데이터 추가하는 함수
	function populateOrderTable(data) {
	    let table = document.getElementById("orderTable");
	    table.innerHTML = ""; // 기존 데이터를 삭제하여 테이블을 초기화
	    
	    //받아온 데이터를 메인 주문 목록에 표시
	    data.forEach(order => {
	        let row = table.insertRow();
	        row.insertCell(0).innerText = order.o_no;
	        row.insertCell(1).innerText = order.o_id;
	        row.insertCell(2).innerText = order.o_address;
	        row.insertCell(3).innerText = order.sum_o_num;
	        row.insertCell(4).innerText = order.sum_o_total;
	        row.insertCell(5).innerText = order.o_date;
	
	        
	        // 주문만 들어온 상태
	        if (order.o_permit === null) {
	        	row.insertCell(6).innerText = "수주 대기";
        	}
	        // 주문 거절 상태
	        else if(order.o_permit === false){
	        	row.insertCell(6).innerText = "수주 거절";
	        } 
	        // 주문 수락 상태
	        else if(order.o_permit === true){
	        	row.insertCell(6).innerText = "수주 확인";
	        }
	        

	        // 열 선택시 해당 열에 대한 모달창 띄움
	        row.addEventListener('click', function() {
	            showOrderDetailModal(order.o_no);
	        });
	    });
	}