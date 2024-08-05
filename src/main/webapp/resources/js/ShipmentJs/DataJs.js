/**
 * 데이터 활용 스크립트
 * 
 */

// 출하 데이터 가져오는 함수
    	async function fetchShip(){
    		try {
    			const response = await fetch("/api/getshipInfo", {
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
    	
    	
    	
    	// 가져온 데이터 페이지에 추가하는 함수
    	function addShipInfo(data){
    		try {
    			let InfoTbody = document.getElementById("InfoTbody");
    			InfoTbody.innerHTML = "";	//테이블 내용 초기화
    			//각각의 데이터를 출력
    			data.forEach(order => {
    				let row = InfoTbody.insertRow();
    				row.insertCell(0).innerText = order.o_no;
    				row.insertCell(1).innerText = order.o_id;
    				row.insertCell(2).innerText = order.p_name+" 외 "+order.p_count+"개";
    				row.insertCell(3).innerText = order.sum_o_total;
    				row.insertCell(4).innerText = order.o_address;
    				
    				
    				if(order.d_complete == 0){
    					if(order.x == null && order.y == null){
    		        		row.insertCell(5).innerText = "배송 전";	
    		        	}
    		        	else{
    		        		row.insertCell(5).innerText = "배송 중";	
    		        	}
    				}
    				
    				else if(order.d_complete == 1){
    					row.insertCell(5).innerText = "배송완료";
    				}
    				
    				else{
    					row.insertCell(5).innerText = "배송 대기";
    					//버튼 추가
        				addB(row, 6, order);
    				}
    				
    			});
    			
    	    } catch (error) {
    	        console.error('Error fetching data:', error);
    	    }
    	}
    	
    	
    	//배달 목록 데이터에 정보 추가 하는 함수
    	async function addputDlvInfo(data){
    		
    		try{
    			let response = await fetch("/api/putDlvInfo", {
    	            method: 'POST',
    	            headers: {
    	                'Accept': 'application/json',
    	                'Content-Type': 'application/json'
    	            },
    	            body: JSON.stringify(data) // data를 JSON 문자열로 변환하여 전송
    	        });
    		
    			
    		}
    		catch(error){
    			console.error('Error fetching data:', error);
    		}
    	}
    	
    	
    	//n번째 자리에 출하 시작 버튼 추가 함수
    	function addB(row, n, data){
            let cell = row.insertCell(n);
            let button = document.createElement('button');
            button.className = 'btn btn-primary start-shipment-btn';
            button.setAttribute('data-toggle', 'modal');
            button.setAttribute('data-target', '#orderDetailModal');
            button.innerText = '출하 시작';
            cell.appendChild(button);
            
         // 버튼에 클릭 이벤트 리스너 추가
            button.addEventListener('click', function() {
            	
                // 배송 정보 데이터 베이스에 데이터 담기
                addputDlvInfo(data)
              	//페이지 새로고침
                location.reload()
                
                
                
                
            });
    	}