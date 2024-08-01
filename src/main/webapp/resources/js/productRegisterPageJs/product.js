// 상품 등록시 새로고침 되는 함수
function uploadReload(){
    let uploadB = document.getElementById("productFrom");
    uploadB.addEventListener("submit",()=>{
        location.reload(); // 페이지 즉시 새로 고침(변경된 재고 수 웹 브라우저에 실시간 반영을 위함)
    })
}

//등록 된 상품 리스트 들고오는 함수
function selectProductInfo(){
    // POST 요청 보내기
    fetch('/product/selectProductInfo', {
        headers: {
            'Accept': 'application/json', // 전송할 데이터의 타입
        }
    })
    .then(response => response.json()) // 응답을 JSON으로 변환
    .then(results => {
       // console.log('Success:', result); // 성공적으로 처리된 결과를 출력
        let productInfoHTML ="";
        let productInfoHTMLCon = document.getElementById("mList");
        results.forEach(result =>{
            productInfoHTML+=
           '<tr>'+'<td>'+result.p_no+'</td>'+
            '<td>'+result.p_name +'</td>' +
            '<td>'+result.p_price  +'</td>'  +
            '</tr>';
        })
        
        productInfoHTMLCon.innerHTML = productInfoHTML;
    })
    .catch(error => {
        console.error('Error:', error); // 오류가 발생한 경우
            });
        }