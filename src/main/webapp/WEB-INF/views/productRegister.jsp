<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
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
						<form action= "/upload" method="post">
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
							<tbody>
								<tr>
									<td>ABC123</td>
									<td>제품A</td>
									<td>10,000원</td>
									<td>50개</td>
									<td>
										<button class="btn btn-info btn-stock btn-sm" data-toggle="modal" data-target="#stockModal">재고관리</button>
									</td>
								</tr>
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
	<div class="modal fade" id="stockModal" tabindex="-1" role="dialog" aria-labelledby="stockModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="stockModalLabel">재고관리</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 재고 관리 내용 -->
					<p>여기에 재고 관리 내용을 입력하세요.</p>
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
</body>
</html>