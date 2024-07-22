<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<style>
#stockTitle{
display: flex;
justify-content: space-between;
padding-left: 10px;
padding-right: 10px;
font-weight: bold;
}
</style>
<!-- 부트스트랩 아이콘 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 나눔고딕체 CDN 링크 -->
<link href="https://cdn.jsdelivr.net/npm/font-nanum@1.1.2/css/nanum.min.css" rel="stylesheet">
<link href="../resources/css/productRegister.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<!-- 제품 등록 폼 -->
		<div class="row">
			<div class="col-lg-12 mx-auto">
				<div class="card pb-4">
					<div class="card-body p-0">
						<!-- 얇은 헤더 -->
						<header class="bg-light py-2 mb-4">
							<div class="container text-center">
								<h6 class="m-0">제품 등록</h6>
							</div>
						</header>
						<form action="/upload" method="post">
							<!-- 첫 번째 줄 -->
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="productName" style="margin-left: 25px;">제품명</label> <input type="text" name="p_name" class="form-control form-control-sm" id="productName" placeholder="제품명 입력" style="margin-left: 25px;">
								</div>
								<div class="form-group col-md-4">
									<label for="productionDate" style="margin-left: 25px;">생산날짜</label> <input type="date" name="m_date" class="form-control form-control-sm" id="productionDate" style="margin-left: 25px;">
								</div>
								<div class="form-group col-md-4">
									<label for="productPrice" style="margin-left: 25px;">제품단가</label> <input type="number" name="p_price" class="form-control form-control-sm" id="productPrice" placeholder="제품단가 입력" style="margin-left: 25px;">
								</div>
							</div>
							<!-- 두 번째 줄 -->
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="productionQuantity" style="margin-left: 25px;">생산수량</label> <input type="number" name="m_num" class="form-control form-control-sm" id="productionQuantity" placeholder="생산수량 입력" style="margin-left: 25px;">
								</div>
								<div class="form-group col-md-4">
									<label for="expiryDate" style="margin-left: 25px;">유통기한</label> <input type="date" name="p_limitD" class="form-control form-control-sm" id="expiryDate" style="margin-left: 25px;">
								</div>
								<div class="form-group col-md-4 d-flex align-items-end">
									<button type="submit" class="btn btn-primary btn-block btn-sm" style="margin-left: 25px;">등록하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 제품 목록 -->
		<div class="product-list" style="width: 700px;">
			<div class="col-lg-10 p-0" id="product-list">
				<div class="card">
					<div class="card-body p-0">
						<header class="bg-light py-2 m-0">
							<div class="container text-left pl-4" style="display: flex; justify-content: space-between;">
								<h6 class="m-0" style="display: inline;">제품 목록</h6>
								<div>
									<input type="text" id="search" placeholder="제품명 검색" style="padding-left: 5px; font-size: 14px; margin-right: 5px;">
									<button id="icon">
										<i class="bi bi-search" style="display: inline;"></i>
									</button>
								</div>
							</div>
						</header>
						<table class="table product-table m-0">
							<thead class="thead-light">
								<tr>
									<th>제품코드</th>
									<th>제품명</th>
									<th>제품단가</th>
									<th>재고 수</th>
									<th>제품관리</th>
								</tr>
							</thead>
							<tbody id="pList">
								<!-- 상품 리스트들이 출력됨 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 창고 온도 섹션 -->
		<!-- 얇은 헤더 -->
		<div class="warehouse-section p-0" style="width: 377px; height: 330px; border-radius: 3px;">
			<header class="bg-light py-2 mb-4">
				<div class="container text-center p-0">
					<h6 class="m-0 font-weight-bold">창고 온도 :</h6>
				</div>
			</header>
			<div class="col mt-4">
				<div class="warehouse-message" style="text-align: center;">여기에 창고 관련 메시지를 입력하세요.</div>
			</div>
		</div>
	</div>
	<!-- 재고관리 모달 -->
	<div id="stockModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="stockModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="stockModalLabel">재고 관리</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	            	<div id ="stockTitle">
		                <p id="modalPName">제품명</p>
		                <p id="modalPNo">제품 번호</p>
		                <p id="modalPPrice">가격</p>
		                <p id="modalMDate">입고 날짜</p>
		                <p id="modalMNum">재고 수량</p>
		                <p id="modalPLimitD">유통 기한</p>
		            </div>
		            <div id="stockProduct">
		            
		            </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>


	<!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 상품 리스트를 가져오는 fetch -->
	<script>
	getProductList();

	
	
	//등록 상품 리스트를 불러오는 함수
	function getProductList(){
	    fetch('/product/list', {
	        headers: {
	            'Accept': 'application/json' // JSON 응답 요청
	        }
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error('상품리스트 리턴 타입 확인'); // 응답 오류 처리
	        }
	        return response.json(); // 응답 본문을 JSON으로 변환
	    })
	    .then(productLists => {
	        // 전체 상품 리스트
	        console.log(productLists); // 데이터를 처리       

	        // 상품 정보를 그룹화하고 재고 수량 합산
	        let groupedProducts = productLists.reduce((acc, product) => {
	            // 그룹화된 상품 정보가 없으면 초기화
	            if (!acc[product.p_no]) {
	                acc[product.p_no] = { ...product }; // 새로운 상품 번호가 발견되면 객체를 초기화
	                acc[product.p_no].m_num = 0; // 초기 재고 수량
	            }
	            acc[product.p_no].m_num += product.m_num; // 기존 재고 수량에 추가
	            return acc;
	        }, {});

	        // 그룹화된 상품 정보를 배열로 변환
	        let result = Object.values(groupedProducts);

	        // 상품 리스트들이 들어갈 tbody
	        let tbody = document.getElementById("pList");

	        // 상품 리스트 forEach 돌려서 출력
	        result.forEach(product => {
	            // 상품 정보를 담는 변수 
	            let listCont = 
	                '<tr class="products">' +
	                '<td class="p_no"">' + product.p_no + '</td>' +
	                '<td>' + product.p_name + '</td>' +
	                '<td>' + product.p_price + '원</td>' +
	                '<td>' + product.m_num + '개</td>' +
	                '<td>' +
	                    '<button class="btn btn-info btn-stock btn-sm" data-toggle="modal" data-target="#stockModal">' +
	                        '재고관리' +
	                    '</button>' +
	                '</td>' +
	                '</tr>';

	            // 등록되어 있는 상품을 tbody에 담아서 출력
	            tbody.innerHTML += listCont;
	            
	            // 해당 상품의 모든 상품 정보를 들고오는 함수 호출 
	        	inventoryM();
	        });
	    })
	    .catch(error => {
	        console.error('상품 리스트 출력 불가:', error);
	    });
	}
	

	// 해당 상품의 모든 상품정보 들고오는 함수 
	function inventoryM(){
	    // getProductList() 함수를 통해 출력된 products 배열을 담는 변수 
	    let products = document.querySelectorAll(".products");
	 // for 루프를 사용하여 HTMLCollection의 각 요소를 출력
	    for (let i = 0; i < products.length; i++) {
	        console.log(products[i]);
	    }   
	}
	
	</script>
</body>
</html>