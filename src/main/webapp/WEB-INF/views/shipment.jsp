<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출하 관리</title>
    <!-- 부트스트랩 CDN 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table td,
        .table th {
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
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>user123</td>
                                        <td>제품A</td>
                                        <td>3</td>
                                        <td>서울시 강남구</td>
                                        <td></td>
                                        <td><button class="btn btn-primary start-shipment-btn" data-toggle="modal" data-target="#orderDetailModal" data-orderid="1">출하 시작</button></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>user456</td>
                                        <td>제품B</td>
                                        <td>2</td>
                                        <td>서울시 종로구</td>
                                        <td></td>
                                        <td><button class="btn btn-primary start-shipment-btn" data-toggle="modal" data-target="#orderDetailModal" data-orderid="2">출하 시작</button></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>user789</td>
                                        <td>제품C</td>
                                        <td>1</td>
                                        <td>부산시 해운대구</td>
                                        <td></td>
                                        <td><button class="btn btn-primary start-shipment-btn" data-toggle="modal" data-target="#orderDetailModal" data-orderid="3">출하 시작</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 출하 상세 정보 모달 -->
    <div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailModalLabel">출하 상세 정보</h5>
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

    <!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 출하 시작 버튼 클릭 이벤트 처리 -->
    <script>
        $(document).ready(function() {
            $('.start-shipment-btn').click(function() {
                var orderId = $(this).data('orderid');
                // 모달 내용 업데이트 등의 추가 동작이 필요할 경우 여기에 구현

                // 모달 열기
                $('#orderDetailModal').modal('show');
            });
        });
    </script>
    
    <script>
    	async function fetchShip(){
    		try {
    	        
    	    } catch (error) {
    	        console.error('Error fetching data:', error);
    	    }
    	}
    </script>
</body>

</html>
