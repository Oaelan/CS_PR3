<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역</title>
    <!-- 부트스트랩 CDN 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    	body {
    		font-family: 나눔고딕;
    	}
    	
    	th {
    		font-weight: normal;
    	}
    	
    	.table th {
    		text-align: center;
    	}
        .table td	{
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            text-align: center;
            vertical-align: middle;
		}
        
        .table thead th {
        	border-bottom: none;
        	vertical-align: middle;
        	font-size: 18px;
        	font-weight: bold;
        	
        }
        
        header {
        	background-color: #007bff;
        	color: white;
        }

        .modal-footer .btn-confirm {
            background-color: #28a745;
            color: white;
        }

        .modal-footer .btn-reject {
            background-color: #dc3545;
            color: white;
        }

        .table {
            border-left: lightgray;
            border-right: lightgray;
        }

        #totalSum {
            display: flex;
            justify-content: flex-start;
        }

        .dropdown-toggle {
            background-color: #ffffff; /* 배경색을 흰색으로 설정 */
            color: #000000; /* 글자색을 검은색으로 설정 */
            /* border: 1px solid lightgray; /* 테두리를 lightgray로 설정 */
            border: none;
		}
        .dropdown-toggle::after {
            border-top-color: #000000; /* 화살표 색상을 검은색으로 설정 */
        }

        .dropdown-menu {
            border: 1px solid lightgray; /* 드롭다운 메뉴의 테두리를 lightgray로 설정 */
        }

        .dropdown-menu a.dropdown-item {
            color: #000000; /* 드롭다운 메뉴 항목 텍스트 색상을 검은색으로 설정 */
        }

        .dropdown-menu a.dropdown-item:hover {
            background-color: lightgray; /* 드롭다운 메뉴 항목 호버 배경색 설정 */
        }
        
        #btn1, #btn2 {
        	font-size: 18px;
        	font-weight: bold;
        }
        
        modal-content table td {
        	text-align: left;
        }

    </style>
</head>

<body>
	<!-- 페이지 주문 내역  -->
	<div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <header class="py-2 mb-0">
                            <div class="container text-center">
                                <h5 class="m-0">주문 내역</h5>
                            </div>
                        </header>
                        <div class="table-responsive">
                            <table class="table table-striped text-center mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">수주번호</th>
                                        <th scope="col">주문자 ID</th>
                                        <th scope="col">배달 주소지</th>
                                        <th scope="col">주문 개수</th>
                                        <th scope="col">총 단가</th>
										<th scope="col">
											<div class="dropdown">
												<button class="btn btn-primary dropdown-toggle"
													type="button" data-bs-toggle="dropdown"
													aria-expanded="false" id="btn1">주문 일자</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" id ="sortDateAsc">등록순</a></li>
													<li><a class="dropdown-item" id ="sortDateDesc">최신순</a></li>
												</ul>
											</div>
										</th>
										<th scope="col">
											<div class="dropdown">
												<button class="btn btn-primary dropdown-toggle"
													type="button" data-bs-toggle="dropdown"
													aria-expanded="false" id="btn2">상태</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" id = "filterAccept" href="#">수주 확인</a></li>
													<li><a class="dropdown-item" id = "filterReject" href="#">수주 거절</a></li>
													<li><a class="dropdown-item" id = "filterPend" href="#">수주 대기</a></li>
												</ul>
											</div>
										</th>
                                    </tr>
                                </thead>
                                <tbody id = "orderTable">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 주문 상세 모달 -->
    <div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailModalLabel">주문 상세 정보</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- 주문 내역 div -->
                <div class="modal-body p-0">
                	<table class="table m-0 ">
                    	<thead>
                            <tr>
                                <th scope="row">제품번호</th>
                                <th scope="row">제품명</th>
                                <th scope="row">개수</th>
                                <th scope="row">가격</th>
                            </tr>
                     	<thead>
                     	
                        <tbody id = "orderDetailsTableBody">
                        <!-- 스크립트로 상세내역 입력 -->
                        </tbody>
                        
                    </table>
                </div>
                <!-- 내역 합계 -->
				<div id="totalSum" class="mt-3 d-flex align-items-center pl-4 pb-3"
					style="text-align: center; width: 100%;">
					<p class="mr-2" style="margin: 0; display: inline;">총 합계 :</p>
					<span id="totalAmount" style="display: inline;"></span>
				</div>
				<!-- 상세 내역의 수주 확인 거절 , 명세서 버튼-->
				<div class="modal-footer">
                    <button type="button" id = "goInvoice" style = "display:none" class="btn btn-primary mr-auto" data-bs-dismiss="modal">거래 명세서</button>
                    <button type="button" id = "acceptOrder" style = "display:none" class="btn btn-confirm" data-bs-dismiss="modal">수주 확인</button>
                    <button type="button" id = "rejectOrder" style = "display:none" class="btn btn-reject" data-bs-dismiss="modal">수주 거절</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    <!-- 주문 내역 스크립트 -->
	<script>
	
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
	        
	        //수락 거절 명세서 버튼
	        const reject = document.getElementById('rejectOrder');
	        const accept = document.getElementById('acceptOrder');
	        const goInvoice = document.getElementById('goInvoice');
	        
	        
	        DetailName.innerHTML = "수주번호: " + o_no;
	        tableBody.innerHTML = '';
	        let totalSum = 0; // 총합을 저장할 변수
	        
	        data.forEach(function(orderDetail) {
	            var row = document.createElement('tr');
	            row.innerHTML = '<td>' + orderDetail.p_no + '</td>' +
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
	            	reject.style.display = 'none';
	                accept.style.display = 'none';
	                if(orderDetail.o_permit == true){
	                	goInvoice.style.display = 'block'
	                }
	            }
	        	
	        });

            
	        
	        
	        document.getElementById('totalAmount').innerText = totalSum.toLocaleString();
	        
	        $('#orderDetailModal').modal('show');  // Show the modal
	     
	        // 주문 거절 이벤트 리스너
	        reject.addEventListener('click', function() {
	            rejectOrder(o_no);
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

	
	
	
	
	//수주 거절 함수
	function rejectOrder(o_no){
		fetch("/api/rejectOrder?o_no="+ o_no, {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
        .then(location.reload())
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
	
	
	
	
	
	//실행 이벤트 리스너
	document.addEventListener("DOMContentLoaded", function() {
	    fetchOrderList()
	        .then(data => {
                    populateOrderTable(data);
                    
                    // 최신순 날짜 정렬
                    document.getElementById('sortDateAsc').addEventListener('click', function() {
                        const sortedData = [...data].sort((a, b) => new Date(a.o_date) - new Date(b.o_date));
                        populateOrderTable(sortedData);
                    });

                 	// 등록순 날짜 정렬
                    document.getElementById('sortDateDesc').addEventListener('click', function() {
                        const sortedData = [...data].sort((a, b) => new Date(b.o_date) - new Date(a.o_date));
                        populateOrderTable(sortedData);
                    });
                 	
                 	// 수락 우선 정렬 필터링
                    document.getElementById('filterAccept').addEventListener('click', function() {
                        const filteredData = data.filter(order => order.o_permit === true);
                        populateOrderTable(filteredData);
                    });

                 	// 거절 우선 정렬 필터링
                    document.getElementById('filterReject').addEventListener('click', function() {
                        const filteredData = data.filter(order => order.o_permit === false);
                        populateOrderTable(filteredData);
                    });

                 	// 대기 우선 정렬 필터링
                    document.getElementById('filterPend').addEventListener('click', function() {
                        const filteredData = data.filter(order => order.o_permit === null);
                        populateOrderTable(filteredData);
                    });
                })
	        .catch(error => console.error('Error handling data:', error));
	});
	
	
	
    </script>
</body>

</html>
