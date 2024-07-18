<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
    <!-- 부트스트랩 CDN 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 나눔고딕체 CDN 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/font-nanum@1.1.2/css/nanum.min.css" rel="stylesheet">
    <style>
        /* 기본 글꼴을 나눔고딕체로 설정 */
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }

        .form-control {
            width: calc(100% - 50px);
            margin-right: 25px;
            margin-left: 25px;
        }

        .btn-block {
            width: calc(100% - 50px);
            padding: 0.375rem 1.25rem;
            margin-left: 25px;
        }

        .form-row {
            justify-content: center;
        }

        .product-list {
            margin-top: 50px;
            float: left;
            width: calc(70% - 50px);
            /* 제품목록 박스의 너비 조정 */
            margin-right: 30px;
            /* 오른쪽 여백 설정 */
        }

        #product-list {
            overflow-y: auto;
            max-height: 330px; /* 최대 높이 설정 */
        }

        .warehouse-section {
            margin-top: 50px;
            float: left;
            width: 30%;
            /* 창고온도 박스의 너비 조정 */
        }

        .product-table {
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .product-table th,
        .product-table td {
            padding: 10px;
            text-align: center;
            vertical-align: middle;
            border-bottom: none;
        }

        .table thead th {
            border-bottom: none;
        }

        .btn-stock {
            padding: 5px 10px;
            font-size: 12px;
        }

        .product-list .card-header h6 {
            margin-left: 25px;
        }

        /* 추가한 스타일 */
        .warehouse-section {
            margin-top: 50px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            height: 100px;
            /* 높이를 조정하여 박스 크기를 줄임 */
        }

        .warehouse-header {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .warehouse-message {
            font-size: 14px;
        }
    </style>
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
                        <form>
                            <!-- 첫 번째 줄 -->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="productName" style="margin-left: 25px;">제품명</label>
                                    <input type="text" class="form-control form-control-sm" id="productName"
                                        placeholder="제품명 입력" style="margin-left: 25px;">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="productionDate" style="margin-left: 25px;">생산날짜</label>
                                    <input type="date" class="form-control form-control-sm" id="productionDate"
                                        style="margin-left: 25px;">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="productPrice" style="margin-left: 25px;">제품단가</label>
                                    <input type="number" class="form-control form-control-sm" id="productPrice"
                                        placeholder="제품단가 입력" style="margin-left: 25px;">
                                </div>
                            </div>
                            <!-- 두 번째 줄 -->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="productionQuantity" style="margin-left: 25px;">생산수량</label>
                                    <input type="number" class="form-control form-control-sm" id="productionQuantity"
                                        placeholder="생산수량 입력" style="margin-left: 25px;">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="expiryDate" style="margin-left: 25px;">유통기한</label>
                                    <input type="date" class="form-control form-control-sm" id="expiryDate"
                                        style="margin-left: 25px;">
                                </div>
                                <div class="form-group col-md-4 d-flex align-items-end">
                                    <button type="submit" class="btn btn-primary btn-block btn-sm"
                                        style="margin-left: 25px;">등록하기</button>
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
                            <div class="container text-center">
                                <h6 class="m-0">제품 목록</h6>
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
                                        <button class="btn btn-info btn-stock btn-sm" data-toggle="modal"
                                            data-target="#stockModal">재고관리</button>
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
                    <h6 class="m-0 font-weight-bold">창고 온도 : </h6>
                </div>
            </header>
            <div class="col mt-4">
                <div class="warehouse-message" style="text-align: center;">
                    여기에 창고 관련 메시지를 입력하세요.
                </div>
            </div>
        </div>
    </div>

    <!-- 재고관리 모달 -->
    <div class="modal fade" id="stockModal" tabindex="-1" role="dialog" aria-labelledby="stockModalLabel"
        aria-hidden="true">
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