/**
 * 상세 모달창 스크립트
 * 
 */

//수주번호에 따라 값을 가져와 모달창에 입력하는 함수
	async function showOrderDetailModal(o_no) {
	    try {
	        const response = await fetch("/api/getOListDetail?o_no=" + o_no, {
	            method: 'GET',
	            headers: {
	                'Accept': 'application/json',
	                'Content-Type': 'application/json'
	            }
	        });
	        
	        const data = await response.json();
	        
	        // 데이터 입력할 모달창
	        const DetailName = document.getElementById('orderDetailModalLabel');
	        const tableBody = document.getElementById('orderDetailsTableBody');
	        
	        //수락, 거절, 명세서 버튼
	        const reject = document.getElementById('rejectOrder');
	        const accept = document.getElementById('acceptOrder');
	        const goInvoice = document.getElementById('goInvoice');
	        
	        
	        DetailName.innerHTML = "수주번호: " + o_no;
	        tableBody.innerHTML = '';
	        let totalSum = 0; // 총합을 저장할 변수
	        
	        //가져온 각각의 데이터를 모달창에 입력
	        data.forEach(function(orderDetail) {
	            var row = document.createElement('tr');
	            row.innerHTML = '<td><input type="checkbox" class="order-checkbox" value="' + orderDetail.p_no + '"></td>' +
	            				'<td>' + orderDetail.p_no + '</td>' +
	                            '<td>' + orderDetail.p_name + '</td>' +
	                            '<td>' + orderDetail.o_num + '</td>' +
	                            '<td>' + orderDetail.o_total + '</td>';
	            tableBody.appendChild(row);
	                
	            totalSum += parseFloat(orderDetail.o_total.replace(/,/g, '')) || 0;
	            
	            
	         
	            
	            // 수락 또는 거절 안한 상태일 때만 버튼 표시
	            if (orderDetail.o_permit === null) {
	                reject.style.display = 'block';
	                accept.style.display = 'block';
	                goInvoice.style.display = 'none'
	            }
	            // 선택 했을 경우 버튼 숨김
	            else{
	            	goInvoice.style.display = 'none'
	            	reject.style.display = 'none';
	                accept.style.display = 'none';
	                if(orderDetail.o_permit == true){
	                	goInvoice.style.display = 'block'
	                }
	            }
	        	
	        });

	     // 체크박스 클릭 이벤트 리스너 추가하는 함수
	    	document.querySelectorAll('.order-checkbox').forEach(function(checkbox) {
	    		checkbox.addEventListener('change', function() {
	    			var checkedOrderNumbers = getCheckedOrderNumbers();
	    			console.log(checkedOrderNumbers); // 체크된 orderDetail.o_num 배열 출력
	    		});
	    	});
	        
	        
	        document.getElementById('totalAmount').innerText = totalSum.toLocaleString();
	        
	        $('#orderDetailModal').modal('show');  // Show the modal
	     
	        // 주문 거절 이벤트 리스너
	        reject.addEventListener('click', function() {
	        	rejectCheckedOrders(o_no);
	            location.reload(); 
	        });
	        
	        // 주문 수락 이벤트 리스너
	        accept.addEventListener('click', function() {
	            acceptOrder(o_no);
	            location.reload(); 
	        });
	        
	        
	        //명세서 페이지로 이동
	        goInvoice.addEventListener('click', function() {
	        	window.location.href = '/invoice?o_no=' + o_no;
	        });
	        
	    } catch (error) {
	        console.error('Error fetching data:', error);
	        throw error; // 에러 발생 시 이후 코드가 실행되지 않도록 예외를 던집니다.
	    }
	}

	
	// 체크된 체크박스의 p_no 값을 가져오는 함수
	function getCheckedOrderNumbers() {
		var checkedOrderNumbers = [];
	    var checkboxes = document.querySelectorAll('.order-checkbox:checked');
	    checkboxes.forEach(function(checkbox) {
	    	checkedOrderNumbers.push(checkbox.value);
	    });
		return checkedOrderNumbers;
	}

	
	
	
	//수주 거절 함수
	function rejectOrder(o_no, p_no){
		fetch("/api/rejectOrder?o_no="+ o_no + "&p_no="+ p_no, {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
         .then(response => {
	        if (response.ok) {
	            location.reload();
	        } else {
	            console.error('Failed to reject order:', response.statusText);
	        }
	    })
	}
	
	// 체크된 체크박스의 p_no 값을 가져와서 수주 거절
	function rejectCheckedOrders(o_no) {
	    var checkedOrderNumbers = getCheckedOrderNumbers();
	    checkedOrderNumbers.forEach(function(p_no) {
	        rejectOrder(o_no, p_no);
	    });
	}
	
	
	//수주 수락 함수
	function acceptOrder(o_no){
		fetch("/api/acceptOrder?o_no="+ o_no, {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
        .then(location.reload())
	}