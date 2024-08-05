<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송 상태</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- header css 링크 -->
    <link rel="stylesheet" href="../resources/css/header.css?ver=1">
    <style>
    	body {
    		font-family: 나눔고딕;
    	}
    	
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
    </style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="container mt-5">
        <strong style="font-size: 24px;">실시간 배송 위치 안내</strong>
		<div class="status-box mt-3">
			<div id="map" style="width: 100%; height: 500px;"></div>

		</div>
		<div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <!-- 테이블과 헤더는 그대로 유지 -->
                        <header class="py-2 mb-0">
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
                                <tbody id = "dlvTable">
                                 	<!-- 스크립트로 내용 추가 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 모달 --> 
    <div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailModalLabel">배송 상태</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>물품이 배송 전 입니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7eaf2bce6e8bb4b9048e3a6a6288e3c4">
	</script>
	<script src = "../resources/js/deliveryStateJs/main.js"></script>
	<!-- <script>
		 
	
	document.addEventListener("DOMContentLoaded", function() {
		fetchDlvList()
        .then(data => {
                populateDlvTable(data);
        });
		 setInterval(async function() {
	            const data = await fetchDlvList();
	            populateDlvTable(data);
	        }, 3000);
	});
	

	//데이터 가져오는 fetch함수
	async function fetchDlvList() {
	    try {
	        const response = await fetch('/api/getDlvState', {
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
	
	
	
	
	
	
	//배송 관리 목록에 데이터 추가하는 함수
	function populateDlvTable(data) {
	    let table = document.getElementById("dlvTable");
	    table.innerHTML = ""; // 기존 데이터를 삭제하여 테이블을 초기화
	    
	    //받아온 데이터를 메인 주문 목록에 표시
	    data.forEach(dlv => {
	        let row = table.insertRow();
	        row.insertCell(0).innerText = dlv.start;
	        row.insertCell(1).innerText = dlv.d_no;
	        row.insertCell(2).innerText = dlv.o_no;
	        row.insertCell(3).innerText = dlv.o_id;
	        row.insertCell(4).innerText = dlv.o_address;
	        
	        

	        // 출하 요청 상태
	        if (dlv.d_complete == null) {
	        	row.insertCell(5).innerText = "배송 전";
        	}
	        // 배송 중인 상태
	        else if(dlv.d_complete == false){
	        	if(dlv.x == 0 && dlv.y == 0){
	        		row.insertCell(5).innerText = "배송 전";	
	        	}
	        	else{
	        		row.insertCell(5).innerText = "배송 중";	
	        	}
	        	
	        } 
	        // 배송 완료 상태
	        else if(dlv.d_complete == true){
	        	row.insertCell(5).innerText = "배송 완료";
	        }
	        row.addEventListener("click", function(){
	        	if (dlv.d_complete == null || dlv.x == 0 && dlv.y == 0) {
	        		$('#orderDetailModal').modal('show');
	        	}
	        	else{
	        		updateMap(dlv);	
	        	}
	        	
	        })
	        

	    });
	}
	
	
	
	// 지도 업데이트 함수
    function updateMap(dlv) {
        const mapContainer = document.getElementById('map'); // 지도를 표시할 div
        const mapOption = {
            center: new kakao.maps.LatLng(dlv.x, dlv.y), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        // 지도 객체를 생성하거나 업데이트
        let map = new kakao.maps.Map(mapContainer, mapOption);
        let marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(dlv.x, dlv.y)
        });
        marker.setMap(map);

        // 지도와 마커를 주기적으로 갱신
        setInterval(async function() {
            // 주기적으로 데이터 가져오기
            const data = await fetchDlvList();
            const updatedDlv = data.find(d => d.d_no === dlv.d_no); // 현재 클릭된 d_no에 해당하는 데이터 가져오기

            if (updatedDlv) {
            	var moveLatLon = new kakao.maps.LatLng(updatedDlv.x, updatedDlv.y);
                map.panTo(moveLatLon);     
                marker.setPosition(new kakao.maps.LatLng(updatedDlv.x, updatedDlv.y));
            }
        }, 1000);
    }
	</script>	 -->
    <!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
