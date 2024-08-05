/**
 * 메인 스크립트
 * 
 */

//실행 이벤트 리스너
    	document.addEventListener("DOMContentLoaded", function() {
//    		배송정보 데이터 가져오는 함수
    		fetchShip()
    	        .then(data => {
//    	        	가져온 데이터 페이지 추가 함수
    	        	addShipInfo(data);
                    })
    	        .catch(error => console.error('Error handling data:', error));
    	});