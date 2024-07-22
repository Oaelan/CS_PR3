<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        	font-size: 17px;
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
        	font-size: 17px;
        }
        
        modal-content table td {
        	text-align: left;
        }

    </style>
</head>

<body>

	<div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <header class="bg-light py-2 mb-0">
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
													<li><a class="dropdown-item" href="#">등록순</a></li>
													<li><a class="dropdown-item" href="#">최신순</a></li>
												</ul>
											</div>
										</th>
										<th scope="col">
											<div class="dropdown">
												<button class="btn btn-primary dropdown-toggle"
													type="button" data-bs-toggle="dropdown"
													aria-expanded="false" id="btn2">상태</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" href="#">수주 확인</a></li>
													<li><a class="dropdown-item" href="#">수주 거절</a></li>
													<li><a class="dropdown-item" href="#">수주 대기</a></li>
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
                <div class="modal-body pb-0">
                    <table class="table m-0">
                        <tbody>
                            <tr>
                                <th scope="row">제품번호</th>
                                <th scope="row">제품명</th>
                                <th scope="row">개수</th>
                                <th scope="row">가격</th>
                            </tr>
                            <tr>
                                <td id="p_no"></td>
                                <td id="p_name"></td>
                                <td id="o_num"></td>
                                <td id="o_total"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="totalSum" class="mt-3 d-flex align-items-center pl-4 pb-3">
                    <p class="mr-2">총 합계 : </p> <span id="totalAmount"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary mr-auto" data-dismiss="modal">거래 명세서</button>
                    <button type="button" class="btn btn-confirm" data-dismiss="modal">수주 확인</button>
                    <button type="button" class="btn btn-reject" data-dismiss="modal">수주 거절</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="orderList.js">
    </script>
    
    <!-- 주문 내역 리스트 -->
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            fetch('/api/getOList', {
                headers: {
                    'Accept': 'application/json'
                }
            })
                .then(response => response.json())
                .then(data => {
                    let table = document.getElementById("orderTable");
                    data.forEach(order => {
                    	//수주번호 같은 것 끼리 묶어서 주문 개수, 총 단가 합치기
                        let row = table.insertRow();
                        row.insertCell(0).innerText = order.o_no;
                        row.insertCell(1).innerText = order.o_id;
                        row.insertCell(2).innerText = order.o_address;
                        row.insertCell(3).innerText = order.o_num;
                        row.insertCell(4).innerText = order.o_total;
                        row.insertCell(5).innerText = order.o_date;
                        row.insertCell(6).innerText = order.o_permit;
                        
                        // 클릭 모달창
                        row.addEventListener('click', function() {
                        	//반복문으로 같은 수주번호 가진거 다 가져와서 총 가격 계산
                        	//제품명 조인으로 가져오기 
                            document.getElementById('p_no').innerText = order.p_no;
                            document.getElementById('p_name').innerText = "제품명 가져오기";
                            document.getElementById('o_num').innerText = order.o_num;
                            document.getElementById('o_total').innerText = order.o_total;

                            $('#orderDetailModal').modal('show');  // Show the modal
                        });
                    });
                })
                .catch(error => console.error('Error fetching data:', error));
        });
    </script>
</body>

</html>
