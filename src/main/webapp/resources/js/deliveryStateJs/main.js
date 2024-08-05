/**
 메인 스크립트
 * 
 */

document.addEventListener("DOMContentLoaded", function() {
//		배송 데이터 가져오는 함수
		fetchDlvList()
        .then(data => {
                populateDlvTable(data);
        });
		 setInterval(async function() {
	            const data = await fetchDlvList();
//	           	 배송 관리 목록에 데이터 추가하는 함수
	            populateDlvTable(data);
	        }, 3000);
	});