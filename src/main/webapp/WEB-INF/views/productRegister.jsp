<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<style>
.stockList, .stockT {
	width: 100px;
	text-align: center;
}

.nonB {
	border: none;
}

#stockTitle {
	display: flex;
	width: 100%;
	justify-content: space-between;
	padding: 10px;
	font-weight: bold;
	background-color: #f1f1f1; /* 배경색 추가 (선택 사항) */
	border-bottom: 1px solid #ddd;
	padding: 10px; /* 하단 경계선 추가 (선택 사항) */
}

#stockProduct {
	display: flex;
	flex-direction: column;
	padding: 10px;
}

.stockCont {
	display: flex;
	width: 100%;
	justify-content: space-between;
	padding: 10px;
	border-bottom: 1px solid #ddd; /* 하단 경계선 추가 (선택 사항) */
	padding: 5px 0; /* 위 아래 패딩 추가 */ .
	stockCont: last-child{
    border-bottom: none; /* 마지막 항목의 하단 경계선 제거 */
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
					<form method="post">
						<div class="modal-body">
							<div id="stockTitle">
								<p id="modalPName" class="m-0 stockT">제품명</p>
								<p id="modalPNo" class="m-0 stockT">제품 번호</p>
								<p id="modalPPrice" class="m-0 stockT">가격</p>
								<p id="modalMDate" class="m-0 stockT">입고 날짜</p>
								<p id="modalMNum" class="m-0 stockT">재고 수량</p>
								<p id="modalPLimitD" class="m-0 stockT">유통 기한</p>
							</div>
							<div id="stockProduct"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							<button type="submit" formaction="유통기한이 지나서 아예 삭제" class="btn btn-danger" id="discardButton">폐기</button>
							<button type="submit" formaction="재고 수정" class="btn btn-primary" id="editButton">수정</button>
						</div>
				</form>	
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

	
	
	// 등록 상품 리스트를 불러오는 함수
	function getProductList() {
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
	        //console.log(productLists); // 데이터를 처리       
	        // 상품 리스트들이 들어갈 tbody
	        let tbody = document.getElementById("pList");
	        // tbody 초기화
	        tbody.innerHTML = "";       
	        // 상품 리스트 forEach 돌려서 출력
	        productLists.forEach(product => {         
	            // 상품 정보를 담는 변수 
	            let listCont = 
	                '<tr class="products">' +
	                '<td>' + product.p_no + '</td>' +
	                '<td>' + product.p_name + '</td>' +
	                '<td>' + product.p_price + '원</td>' +
	                '<td>' + product.m_num + '개</td>' +
	                '<td>' +
	                    '<button class="btn btn-info btn-stock btn-sm" ' +
	                    'id="' + product.p_no + '" ' + // id 설정
	                    'data-toggle="modal" ' +
	                    'data-target="#stockModal">' +
	                    '재고관리' +
	                    '</button>' +
	                '</td>' +
	                '</tr>';             
	            // 등록되어 있는 상품을 tbody에 담아서 출력
	            tbody.innerHTML += listCont;
	        });
	        
	       
	        // 재고관리 버튼
	        let buttons = document.querySelectorAll(".btn-stock");
	        // 재고관리 버튼 눌렀을 때 해당 상품의 코드 번호를 넘겨주고 유통기한별 상품 정보 가져오는 함수 호출
	        groupByDate(buttons);	      
	        
	    })
	    .catch(error => {
	        console.error('상품 리스트 출력 불가:', error);
	    });
	}

	


	   
	
	
	// 재고관리 버튼에 이벤트 추가 함수
	// 재고관리 버튼 이벤트 추가 해당 상품의 p_no 넘겨주고 유통기한별 상품 정보 가져오기
	function groupByDate(buttons) {
	    // 선택한 상품의 코드를 담을 변수
	    let p_no;

	    buttons.forEach(button => {
	        button.addEventListener("click", () => {
	            // 선택할 상품의 코드 초기화
	            p_no = button.id;

	            // 선택한 상품의 코드로 유통기한별 재고 수 들고오기
	            fetch('/product/groupByDate?p_no=' + p_no, {
	                headers: {
	                    'Accept': 'application/json' // JSON 응답 요청
	                }
	            })
	            .then(response => {
	                if (!response.ok) {
	                    throw new Error('리스폰 타입 확인');
	                }
	                return response.json(); // 응답을 JSON 형식으로 변환
	            })
	            .then(products => {
	                // 유통기한 별 상품 정보를 담을 변수 초기화
	                let groupByDateHtml = "";
	                // groupByDate 정보를 담을 모달 창
	                let stockProduct = document.getElementById("stockProduct");

	                // 모달 창의 내용을 초기화
	                stockProduct.innerHTML = "";

	                products.forEach(product => {
	                    // 유통기한을 id로 사용하기 전에 적절한 포맷으로 변환
	                    let limitDateId = product.p_limitD.replace(/[^a-zA-Z0-9]/g, '_'); 

	                    groupByDateHtml +=
	                        '<div class="stockCont">' +
	                        '<input type="text" class="mb-0 nonB stockList " value="' + product.p_name + '" readonly>' +
	                        '<input type="text" class="mb-0 nonB stockList " value="' + product.p_no + '" readonly>' +
	                        '<input type="text" class="mb-0 nonB stockList " value="' + product.p_price + '" readonly>' +
	                        '<input type="text" class="mb-0 nonB stockList " value="' + product.m_date + '" readonly>' +
	                        '<input type="text" id="' + limitDateId + 
	                        '" class="mb-0 stockList updateBtn" readonly value="' + product.m_num + '">' +
	                        '<p class="mb-0 stockList">'+ product.p_limitD + '</p>' +                    
	                        '</div>'; // input id값이 유통기한
	                });

	                // 모달 창에 가져온 데이터 넣기
	                stockProduct.innerHTML = groupByDateHtml;
	                // input 태그 선택
	        	    let updateBtns = document.querySelectorAll(".updateBtn");
	                isReadonly(updateBtns)
	            })
	            .catch(error => {
	                console.error('컨트롤러 확인 또는 패치 헤더 확인', error); // 오류를 처리
	            });
	        });
	    });
	}

	
	
	// 재고관리 모달에 있는 input에 이벤트 추가
	function isReadonly(updateBtns) {
	   
	    
	    updateBtns.forEach(updateBtn => {	     
			//선택한 인풋 태그의 값을 담는 변수 
			let preNum = updateBtn.value;
			
	        // 인풋 태그를 더블 클릭 시 수정 가능
	        updateBtn.addEventListener("dblclick", () => {
	            // readonly 속성이 있을 시 속성 제거 
	            if (updateBtn.hasAttribute("readonly")) {
	                updateBtn.removeAttribute("readonly"); // readonly 속성 제거                 	                
	            }           
	        });
	        
	        // blur시 수정 가능 - > 불가능으로 바뀜
	        updateBtn.addEventListener("blur", () => {
	                updateBtn.setAttribute("readonly",true); // 수량 변경 시 다시 변경 불가 	               
	        });    
	    });
	}

	// 재고 폐기 및 수정 기능
	function updateInventNum(){
	    
	}

	</script>
</body>
</html>