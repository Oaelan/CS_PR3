/**
 * 주요 데이터 활용 script
 * 
 */

//데이터 가져오는 fetch함수
	async function fetchDlvList() {
	    try {
	        const response = await fetch('/api/getDlvState', {
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
	
	
	
	
	
	
	//배송 관리 목록에 데이터 추가하는 함수
	function populateDlvTable(data) {
	    let table = document.getElementById("dlvTable");
	    table.innerHTML = ""; // 기존 데이터를 삭제하여 테이블을 초기화
	    
	    //받아온 데이터를 메인 주문 목록에 표시
	    data.forEach(dlv => {
	        let row = table.insertRow();
	        row.insertCell(0).innerText = dlv.start;
	        row.insertCell(1).innerText = dlv.d_no;
	        row.insertCell(2).innerText = dlv.o_no;
	        row.insertCell(3).innerText = dlv.o_id;
	        row.insertCell(4).innerText = dlv.o_address;
	        
	        

	        // 출하 요청 상태
	        if (dlv.d_complete == null) {
	        	row.insertCell(5).innerText = "배송 전";
        	}
	        // 배송 중인 상태
	        else if(dlv.d_complete == false){
	        	if(dlv.x == 0 && dlv.y == 0){
	        		row.insertCell(5).innerText = "배송 전";	
	        	}
	        	else{
	        		row.insertCell(5).innerText = "배송 중";	
	        	}
	        	
	        } 
	        // 배송 완료 상태
	        else if(dlv.d_complete == true){
	        	row.insertCell(5).innerText = "배송 완료";
	        }
	        row.addEventListener("click", function(){
	        	if (dlv.d_complete == null || dlv.x == 0 && dlv.y == 0) {
	        		$('#orderDetailModal').modal('show');
	        	}
	        	else{
	        		updateMap(dlv);	
	        	}
	        	
	        })
	        

	    });
	}