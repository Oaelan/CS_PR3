<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송 상태</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table td,
        th {
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            text-align: center;
        }

        .table {
            border-left: lightgray;
            border-right: lightgray;
        }

        .status-box {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <strong style="font-size: 24px;">실시간 배송 위치 안내</strong>
		<div class="status-box mt-3">
			<div id="map" style="width: 100%; height: 500px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7eaf2bce6e8bb4b9048e3a6a6288e3c4"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
			</script>
		</div>
		<div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <!-- 테이블과 헤더는 그대로 유지 -->
                        <header class="bg-light py-2 mb-0">
                            <div class="container text-center">
                                <h5 class="m-0">배송 상태</h5>
                            </div>
                        </header>
                        <div class="table-responsive">
                            <table class="table table-striped text-center mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">출하 날짜</th>
                                        <th scope="col">송장 번호</th>
                                        <th scope="col">수주 번호</th>
                                        <th scope="col">주문자 ID</th>
                                        <th scope="col">배달 주소지</th>
                                        <th scope="col">배송 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-toggle="modal" data-target="#orderDetailModal" data-orderid="1">
                                        <td>2024-07-20</td>
                                        <td>123456789</td>
                                        <td>123456</td>
                                        <td>user123</td>
                                        <td>서울시 강남구</td>
                                        <td></td>
                                    </tr>
                                    <tr data-toggle="modal" data-target="#orderDetailModal" data-orderid="2">
                                        <td>2024-07-21</td>
                                        <td>123456789</td>
                                        <td>456789</td>
                                        <td>user456</td>
                                        <td>서울시 종로구</td>
                                        <td></td>
                                    </tr>
                                    <tr data-toggle="modal" data-target="#orderDetailModal" data-orderid="3">
                                        <td>2024-07-22</td>
                                        <td>123456789</td>
                                        <td>789012</td>
                                        <td>user789</td>
                                        <td>부산시 해운대구</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
