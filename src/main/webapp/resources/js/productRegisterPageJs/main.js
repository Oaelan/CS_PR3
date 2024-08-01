document.addEventListener('DOMContentLoaded', function() {
    //등록된 재고 리스트 들고옴
    getProductList();
    // 온도 검색 데이터 들고오는 함수
    TempSearchYMDO();
    // 온도 검색 options 만드는 함수
    createTempSearchYMDOptions();
    // 등록 된 상품 리스트 들고 옴
    selectProductInfo();
    // 등록되어 있는 상품들의 정보를 들고옴
    productsInfo();
    // 상품명 선택 시 자동으로 단가 선택 됨
    autoPriceSelect();
    // 물류 창고 온도 가져오기(1초마다 가져오기)
    setInterval(selectFactoryTemp, 1000);
    // 창고 온도에 따라 토스트 창 띄우는 함수
    setInterval(toastForTem, 1000);
  // 상품등록시 새로고침 되는 함수
    uploadReload();

    //등록 폼에 submit 이벤트 리스너 추가 상품 등록시 상품과 단가가 맞이 않으면 등록 불가 기능
    document.getElementById("pUploadF").addEventListener("submit", isCorrectPrice);
    // 검색버튼에 상품명/상품코드로 검색할 수 있는 기능 
    document.getElementById("serachB").addEventListener("click", searchProduct);
    //(검색 후 ) 재고 목록 타이틀을 눌렀을 때 전체 목록 다시 가져오기 위해 새로 고침 하는 기능
    document.getElementById("stockL").addEventListener("click", ()=>{
        location.reload();
    });
});


