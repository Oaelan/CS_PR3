/**
 * 메인 스크립트
 * 
 */

document.addEventListener("DOMContentLoaded", function() {
	const urlParams = new URLSearchParams(window.location.search);
    const o_no = urlParams.get('o_no'); // 쿼리 파라미터에서 'o_no' 값을 가져옴
    
    //주문 상세 함수 실행
	fetchOListDetail(o_no);
});