/**
 * 페이지 출력 스크립트
 * 
 */

//페이지 인쇄 함수
function printPage() {
	// 버튼을 숨김
    var btns = document.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].style.display = 'none';
    } 

    // 버튼 빼고 인쇄
    window.print();

    // 인쇄 후 버튼을 다시 보이게
    for (var i = 0; i < btns.length; i++) {
        btns[i].style.display = '';
    }
}