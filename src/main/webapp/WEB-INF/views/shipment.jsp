<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출하 관리</title>
    <!-- header css 링크 -->
    <link rel="stylesheet" href="../resources/css/header.css?ver=1">
    <!-- 부트스트랩 CDN 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
	body {
		font-family: 나눔고딕;
	}
	
	.table td, .table th {
		padding-left: 0;
		padding-right: 0;
		cursor: pointer;
		text-align: center;
	}
	
	.table {
		border-left: lightgray;
		border-right: lightgray;
	}
	
	.table td {
		vertical-align: middle;
	}
	
	header {
		background-color: #007bff;
		color: white;
	}
	
	.table thead th {
		border-bottom: none;
		vertical-align: middle;
		font-size: 18px;
		font-weight: bold;
	}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

<!-- 출하 관리 리스트 div -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <header class="py-2 mb-0">
                            <div class="container text-center">
                                <h5 class="m-0">출하 관리</h5>
                            </div>
                        </header>
                        <div class="table-responsive">
                            <table class="table table-striped text-center mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">수주번호</th>
                                        <th scope="col">주문자 ID</th>
                                        <th scope="col">제품명</th>
                                        <th scope="col">총 개수</th>
                                        <th scope="col">배달 주소지</th>
                                        <th scope="col">상태</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody id = "InfoTbody">
                                    <!-- 스크립트로 상세 내용 입력 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 
    필요시 모달 사용
    <div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailModalLabel">출하 상세</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>출하가 시작되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
 -->
    <!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    
    <script>
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
    	
    	
    	
    	
    	//실행 이벤트 리스너
    	document.addEventListener("DOMContentLoaded", function() {
    		fetchShip()
    	        .then(data => {
    	        	addShipInfo(data);
                    })
    	        .catch(error => console.error('Error handling data:', error));
    	});
    	
    </script>
</body>

</html>
