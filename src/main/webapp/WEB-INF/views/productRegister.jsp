<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<style>
#tempCon {
	overflow-y: auto;
	max-height: 330px;
}

#stockL {
	cursor: pointer;
}

body {
	height: 100%;
	font-family: 나눔고딕;
}

#invenNotice {
	font-weight: bold;
}

.stockList, .stockT {
	width: 100px;
	text-align: center;
}

.checkB {
	width: 100px;
}

.nonB {
	border: none;
	cursor: default;
	pointer-events: none;
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

header {
	background-color: #007bff;
	color: white;
}
</style>
 <!-- Flatpickr CSS -->
<link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
<!-- 부트스트랩 아이콘 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 나눔고딕체 CDN 링크 -->
<link href="https://cdn.jsdelivr.net/npm/font-nanum@1.1.2/css/nanum.min.css" rel="stylesheet">
<link href="../resources/css/productRegister.css" rel="stylesheet">
</head>
<body>
	<div class="container" style="display: flex; flex-direction: column; gap: 30px";>
		<div class="container mt-5">
			<!-- 제품 등록 폼 -->
			<div class="row">
				<div class="col-lg-12 mx-auto">
					<div class="card pb-4">
						<div class="card-body p-0">
							<!-- 얇은 헤더 -->
							<header class="py-2 mb-4">
								<div class="container text-center">
									<h6 class="m-0">재고 등록</h6>
								</div>
							</header>
							<form method="post" action="/upload" id="pUploadF">
								<!-- 첫 번째 줄 -->
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="productName" style="margin-left: 25px;">제품명</label> <select name="p_name" id="pNameSelect" class="form-control form-control-sm" style="margin-left: 25px;" required="required">
											<!-- 옵션들 추가 -->
										</select>
									</div>
									<div class="form-group col-md-4">
										<label for="productionDate" style="margin-left: 25px;">생산날짜</label> <input type="date" name="m_date" class="form-control form-control-sm" id="productionDate" style="margin-left: 25px;" required="required">
									</div>
									<div class="form-group col-md-4">
										<label for="productPrice" style="margin-left: 25px;">제품단가</label> <select name="p_price" id="pPriceSelect" class="form-control form-control-sm" style="margin-left: 25px;" required="required">
											<!-- 옵션들 추가 -->
										</select>
									</div>
								</div>
								<!-- 두 번째 줄 -->
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="productionQuantity" style="margin-left: 25px;">생산수량</label> <input type="number" name="m_num" class="form-control form-control-sm" id="productionQuantity" placeholder="생산수량 입력" style="margin-left: 25px;" required="required">
									</div>
									<div class="form-group col-md-4">
										<label for="expiryDate" style="margin-left: 25px;">유통기한</label> <input type="date" name="p_limitD" class="form-control form-control-sm" id="expiryDate" style="margin-left: 25px;" required="required">
									</div>
									<div class="form-group col-md-4 d-flex align-items-end">
										<button type="submit" class="btn btn-primary btn-block btn-sm" id="uploadBtn" style="margin-left: 25px;">등록하기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="listTempCon" style="display: flex;">
				<!-- 제품 목록 -->
				<div class="product-list mr-0">
					<div class="col-lg-10 p-0" id="product-list" style="max-width:100%">
						<div class="card">
							<div class="card-body p-0">
								<header class="bg-light py-2 m-0">
									<div class="container text-left pl-4" style="display: flex; justify-content: space-between; align-items: center">
										<h6 class="m-0" style="display: inline;" id="stockL">재고 목록</h6>
										<div>
											<input type="text" id="search" name="searchWord" placeholder="제품명 검색" style="padding-left: 5px; font-size: 14px; margin-right: 5px;">
											<button id="serachB">
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
				<div class="warehouse-section p-0" id="tempCon" style="width:40%; height: 330px; border-radius: 3px;">
					<header class="bg-light py-2 mb-4" style="position: fixed">
						<div class="container text-center p-0">
							<h6 class="m-0 font-weight-bold">창고 온도 :</h6>
						</div>
					</header>
					<div class="col mt-4" id="tempList">
						<div class="warehouse-message" style="text-align: center;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="container" style="display: flex; justify-content:space-between";>
			<!--  등록되어 있는 상품 리스트(판매를 하기 위해 등록한 상품 리스트) -->
			<div class="product-list m-0" style="width: 60%;">
				<div class="card">
					<div class="card-body p-0">
						<header class="bg-light py-2 m-0">
							<div class="container text-left pl-4" style="display: flex; justify-content: space-between;">
								<h6 class="m-0" style="display: inline;">상품 목록</h6>
							</div>
						</header>
						<table class="table product-table m-0">
							<thead class="thead-light">
								<tr>
									<th>제품 코드</th>
									<th>제품명</th>
									<th>제품단가</th>
								</tr>
							</thead>
							<tbody id="mList">
								<!-- 상품 리스트들이 출력됨 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 새 상품 등록 창 -->
			<div class="form-container" style="width: 35%;">
				<div class="form-header">
					<h5 style="text-align:center">상품 등록</h5>
				</div>
				<form id="productForm" style="display:flex; flex-direction:column; justify-content: center; align-items: center;">
					<div class="form-group" style="display:flex; justify-content:space-evenly; align-items:center;">
						<label for="pName" class ="m-0" style="text-align:center">품명</label>
						<input type="text" class="form-control m-0" id="pName" name="pName" required style="width:70%;">
					</div>
					<div class="form-group" style="display:flex; justify-content:space-evenly; align-items:center;">
						<label for="pPrice" class ="m-0" style="text-align:center">단가</label>
						<input type="number" class="form-control m-0" id="pPrice" name="pPrice" required style="width:70%;">
					</div>
					<button type="submit" class="btn btn-primary btn-register" style="width:56%";>등록</button>
				</form>
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
							<div id="stockTitle">							
								<p id="modalPNo" class="m-0 stockT">선택</p>							
								<p id="modalMDate" class="m-0 stockT">입고 날짜</p>
								<p id="modalPLimitD" class="m-0 stockT">유통 기한</p>	
								<p id="modalMNum" class="m-0 stockT">재고 수량</p>												
							</div>
							<div id="stockProduct"></div>
						</div>
						<div class="modal-footer" style="display: flex; justify-content: space-between;">
							<p id="invenNotice">* 수량 더블 클릭 시 수정 가능 / 폐기는 체크 후 가능</p>
								<div id="btnC">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-danger discardButton" id="discardButton">폐기</button>
									<button type="submit" class="btn btn-primary editButton" id="editButton">수정</button>							
								</div>
						</div>
			</div>
		</div>
	</div>
	<!-- 상품 등록시 값이 비워져 있을 때 뜨는 모달 창 -->
	<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="alertModalLabel">제품 등록 오류</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    	등록 정보를 모두 입력 또는 상품과 단가를 다시 확인해 주세요.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 재고 검색시 등록된 재고가 없을 때 뜨는 모달 -->
    <div class="modal fade" id="noProductModal" tabindex="-1" role="dialog" aria-labelledby="noProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="noProductModalLabel">재고 등록이 필요합니다.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    	등록된 재고 정보가 없습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
	<!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- productRegister페이지 관련 js -->
	<script type="text/javascript" src="../resources/js/productRegister.js"?ver=1224></script>
</body>
</html>