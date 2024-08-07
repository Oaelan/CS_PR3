//등록 된 재고 리스트를 불러오는 함수
function getProductList() {
    fetch('/product/list', {
        headers: {
            'Accept': 'application/json' // JSON 응답 요청
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('상품리스트 리턴 타입 확인'); // 응답 오류 처리
        }
        return response.json(); // 응답 본문을 JSON으로 변환
    })
    .then(productLists => {
        // 전체 재고 리스트
        //console.log(productLists); // 데이터를 처리       
        // 재고 리스트들이 들어갈 tbody
        let tbody = document.getElementById("pList");
        // tbody 초기화
        tbody.innerHTML = "";       
        // 재고 리스트 forEach 돌려서 출력
        productLists.forEach(product => {         
            // 재고 정보를 담는 변수 
            let listCont = 
                '<tr class="products">' +
                '<td>' + product.p_no + '</td>' +
                '<td>' + product.p_name + '</td>' +
                '<td>' + product.p_price + '원</td>' +
                '<td>' + product.m_num + '개</td>' +
                '<td>' +
                '<button class="btn btn-info btn-stock btn-sm" ' +
                'id="' + product.p_no + '" ' + // id 설정
                'data-toggle="modal" ' +
                'data-target="#stockModal" ' +
                'style="padding-left: 5px; padding-right: 5px;">' +
                '재고관리' +
                '</button>'
                '</td>' +
                '</tr>';             
            // 되어 있는 상품을 tbody에 담아서 출력
            tbody.innerHTML += listCont;
        });  
        // 재고관리 버튼
        let buttons = document.querySelectorAll(".btn-stock");
        //console.log(buttons)
        // 재고관리 버튼 눌렀을 때 해당 상품의 코드 번호를 넘겨주고 유통기한별 상품 정보 가져오는 함수 호출
        groupByDate(buttons);            
    })
    .catch(error => {
        console.error('상품 리스트 출력 불가:', error);
    });
}

//재고관리 버튼에 이벤트 추가 함수
async function groupByDate(buttons) {
    // 선택한 상품의 코드를 담을 변수
    let p_no;
    let  stockCont;
    buttons.forEach(button => {
        button.addEventListener("click", async () => {
            // 선택할 상품의 코드 초기화
            p_no = button.id;
            try {
                // 재고관리 버튼 이벤트 추가 해당 상품의 p_no 넘겨주고 유통기한별 상품 정보 가져오기
                const { stockConts } = await groupByDateFetch(p_no);
             // console.log(stockConts); // 비동기 작업 후 결과를 출력    
         
                let products  =   updateInventNum(stockConts); 
                // 수정 기능 함수 호출
                updateInventB(products);
                // 폐기 기능 호출 함수                  
                disposeB(products);
                
            } catch (error) {
                console.error('데이터를 가져오는 중 오류 발생:', error);
            }            
        });
    });
}

async function groupByDateFetch(p_no) {
    try {
        // 선택한 상품의 코드로 유통기한별 재고 수 들고오기
        const response = await fetch('/product/groupByDate?p_no=' + p_no, {
            headers: {
                'Accept': 'application/json' // JSON 응답 요청
            }
        });

        if (!response.ok) {
            throw new Error('리스폰 타입 확인');
        }

        const products = await response.json(); // 응답을 JSON 형식으로 변환

        // 유통기한 별 상품 정보를 담을 변수 초기화
        let groupByDateHtml = "";
        // groupByDate 정보를 담을 모달 창
        let stockProduct = document.getElementById("stockProduct");
        // 모달 창의 내용을 초기화
        stockProduct.innerHTML = "";

        // 유통기한별 상품 출력문
        products.forEach(product => {
            // 유통기한을 id로 사용하기 전에 적절한 포맷으로 변환
            let limitDateId = product.p_limitD.replace(/[^a-zA-Z0-9]/g, '_');
            // 재고 관리 모달창 타이틀에 해당 상품명 넣을거임
            let stockModalLabel = document.getElementById("stockModalLabel");
            stockModalLabel.innerHTML = product.p_name;
            groupByDateHtml +=
                '<div class="stockCont">' +
                '<input type="checkbox" class="mb-0 checkB stockList" name="disposeStock" id="'+product.m_date+'">' +
                '<input type="text" hidden class="mb-0 nonB stockList" name="p_no" value="' + product.p_no + '" readonly>' +
                '<input type="text" class="mb-0 nonB stockList" name="m_date" value="' + product.m_date + '" readonly>' +
                '<input type="text" class="mb-0 nonB stockList" name="p_limitD" value="' + product.p_limitD + '" readonly>' +
                '<input type="text" class="mb-0 stockList updateBtn m_num" id="' + limitDateId + '" name="m_num" value="' + product.m_num + '" readonly>' +
                '</div>'; // input id값이 유통기한                 
        });

        // 모달 창에 가져온 데이터 넣기
        stockProduct.innerHTML = groupByDateHtml;

        // 수정 기능을 위한 변수(재고관리 모달창에 존재하는 데이터들을 객체로 담을거임)
        let stockConts = document.querySelectorAll(".stockCont");
        let updateBtns = document.querySelectorAll(".updateBtn");

        // 재고관리 모달창에 재고 수량 빼고 나머지 인풋값 못건들게 만드는 함수
        isReadonly(updateBtns);
        // 결과 반환
        return { stockConts };
    } catch (error) {
        console.error('컨트롤러 확인 또는 패치 헤더 확인', error); // 오류를 처리
        // 오류 발생 시 빈 배열 반환
        return { stockConts: [] };
    }
}
//재고 검색 기능 함수
function searchProduct(){
    let  searchWord = document.getElementById("search").value;
    console.log(searchWord)
    fetch('/product/searchProduct?searchWord='+searchWord,{
       headers:{
           'Accept': 'application/json'
       } 
    })
    .then(response =>{
        if(!response.ok){
            throw new Error('서버로부터의 응답이 이상함 ' + response.statusText);
        }
        return response.json();
    })
    .then(response=>{
        // 상품 리스트들이 들어갈 tbody
        let tbody = document.getElementById("pList");
        // tbody 초기화
        tbody.innerHTML = "";  
        let searchResultHTML;
        searchResultHTML = '<tr class="products">' +
                                                        '<td>' + response.p_no + '</td>' +
                                                        '<td>' + response.p_name + '</td>' +
                                                        '<td>' + response.p_price + '원</td>' +
                                                        '<td>' + response.m_num + '개</td>' +
                                                        '<td>' +
                                                        '<button class="btn btn-info btn-stock btn-sm" ' +
                                                        'id="' + response.p_no + '" ' + // id 설정
                                                        'data-toggle="modal" ' +
                                                        'data-target="#stockModal">' +
                                                        '재고관리' +
                                                        '</button>' +
                                                        '</td>' +
                                                        '</tr>';        
        tbody.innerHTML += searchResultHTML;
        
        // 재고관리 버튼
        let buttons = document.querySelectorAll(".btn-stock");
        //console.log(buttons)
        // 재고관리 버튼 눌렀을 때 해당 상품의 코드 번호를 넘겨주고 유통기한별 상품 정보 가져오는 함수 호출
        groupByDate(buttons);            
    })
    .catch(error => {   
        console.error('네트워크 요청 실패:', error);
        $('#noProductModal').modal('show'); // 모달 창 띄우기   
    });
};
//재고관리 모달에 있는 input에 이벤트 추가
function isReadonly(updateBtns) {
    updateBtns.forEach(updateBtn => {        
        //선택한 인풋 태그의 값을 담는 변수 
        let preNum = updateBtn.value;

        // 인풋 태그를 더블 클릭 시 수정 가능
        updateBtn.addEventListener("dblclick", () => {
            // readonly 속성이 있을 시 속성 제거 
            if (updateBtn.hasAttribute("readonly")) {
                updateBtn.removeAttribute("readonly"); // readonly 속성 제거                                    
            }           
        });

        // blur시 수정 가능 - > 불가능으로 바뀜
        updateBtn.addEventListener("blur", () => {
            updateBtn.setAttribute("readonly",true); // 수량 변경 시 다시 변경 불가                   
        });    
    });
}

//재고 수정/ 폐기를 위해 사용되는 모달창에 있는 데이터 정보 담는 배열을 리턴 하는 함수
function updateInventNum(stockConts) {
    // 모달 창에 있는 재고를 담는 변수
    let products = [];
    
    // 모달 창에 있는 모든 재고 정보를 products 배열에 저장
    stockConts.forEach(cont => {
        let product = {
            p_no: cont.querySelector('input[name="p_no"]').value,
            m_date: cont.querySelector('input[name="m_date"]').value,
            p_limitD: cont.querySelector('input[name="p_limitD"]').value,
            m_num: cont.querySelector('input[name="m_num"]').value
        };
        products.push(product);
    });
    return products;
}

//폐기 기능
function disposeB(products) {
    let discardButton = document.getElementById("discardButton");

    // 기존 이벤트 리스너 제거 및 교체
    let newDiscardButton = replaceButton(discardButton);
    
    // 폐기 버튼 클릭 시 이벤트 리스너 정의
    newDiscardButton.addEventListener('click', function() {
        console.log("Inside event listener:", products);
        let updatePro = [];
        let disCheckB = document.querySelectorAll(".checkB");

        // 체크 박스가 선택되어 있다면 updatePro에 배열 저장
        for (let i = 0; i < products.length; i++) {
            if (disCheckB[i] && disCheckB[i].checked) {
                updatePro.push(products[i]);
            }
        }  
        disposeStockFetch(updatePro)
        location.reload(); // 페이지 즉시 새로 고침(변경된 재고 수 웹 브라우저에 실시간 반영을 위함)
        $('#stockModal').modal('hide'); // 모달 숨기기
    });
}

// 재고 수정 기능
function updateInventB(products){
    // console.log(products);
     
   //재고 수정 버튼
     let editButton = document.getElementById("editButton");
     
     // 기존 이벤트 리스너 제거
     let newEditButton = editButton.cloneNode(true);
     editButton.parentNode.replaceChild(newEditButton, editButton);
     
     // 수정 버튼 클릭 시 이벤트 리스너를 정의
     newEditButton.addEventListener('click', function() {
        // console.log("Inside event listener:", products);

         // 수정할 재고들을 담을 변수
         let updatePro = [];
         // 모달창에 있는 재고 인풋태그 들고오기
         let productNums = document.querySelectorAll(".m_num");

         for (let i = 0; i < products.length; i++) {
             let currentNum = productNums[i].value;
             if (currentNum != products[i].m_num) {
                 products[i].m_num = currentNum;
                 updatePro.push(products[i]);              
             }
         }
         updateInventFetch(updatePro);
         location.reload(); // 페이지 즉시 새로 고침(변경된 재고 수 웹 브라우저에 실시간 반영을 위함)
         // jQuery를 사용하여 모달 닫기
         $('#stockModal').modal('hide'); // 모달 숨기기
     });
 }


//재고 수정 fetch 함수
function updateInventFetch(updatePro){
  console.log("Update Inventory Fetch: ", updatePro);
  // POST 요청 보내기
  fetch('/product/updateStock', {
      method: 'POST',
      headers: {
          'Accept': 'application/json', // 전송할 데이터의 타입
          'Content-Type': 'application/json' // 전송할 데이터의 타입
      },
      body: JSON.stringify(updatePro) // 데이터 객체를 JSON 문자열로 변환
  })
  .then(response => response.json()) // 응답을 JSON으로 변환
  .then(result => {
      console.log('Success:', result); // 성공적으로 처리된 결과를 출력
  })
  .catch(error => {
      console.error('Error:', error); // 오류가 발생한 경우
  });
}

//재고 폐기 fetch 함수
function disposeStockFetch(disposeProducts){
  // POST 요청 보내기
  fetch('/product/disposeStock', {
      method: 'POST',
      headers: {
          'Accept': 'application/json', // 전송할 데이터의 타입
          'Content-Type': 'application/json' // 전송할 데이터의 타입
      },
      body: JSON.stringify(disposeProducts) // 데이터 객체를 JSON 문자열로 변환
  })
  .then(response => response.json()) // 응답을 JSON으로 변환
  .then(result => {
      console.log('Success:', result); // 성공적으로 처리된 결과를 출력
  })
  .catch(error => {
      console.error('Error:', error); // 오류가 발생한 경우
          });
      }

//상품 등록 시 제품 선택하면 자동으로 제품 단가 값 선택 되는 함수
function autoPriceSelect(){
    // 이름 셀렉트 태그
    let selectBoxN = document.getElementById("pNameSelect");    
    // 가격 셀렉트 태그
    let selectBoxP = document.getElementById("pPriceSelect");
    
    // 상품 선택에 따라 자동으로 단가 선택
    selectBoxN.addEventListener("change",()=>{  
        // 선택된 옵션의 값을 가져오기
        let selectedValue = selectBoxN.value;    
        console.log( selectedValue)   
        for(i=0; i<selectBoxP.options.length; i++){
            if(selectedValue == selectBoxP.options[i].id ){           
                console.log( selectBoxP.options[i].id)
                // 이 부분에 selectBoxP의 옵션 같이 위의 조건과 만족하는 옵션의 값으로 선택되게 하는           
                selectBoxP.selectedIndex = i;
                break;
            }
        }       
    });
    
};

//productsInfo 테이블에 등록되어 있는 제품 정보 들고오기
function productsInfo() {
fetch('/product/productsInfo', {
    headers: {
        'Accept': 'application/json'
    }
})
.then(response => {
    if (!response.ok) {
        throw new Error('서버로부터의 응답이 이상함 ' + response.statusText);
    }
    return response.json();
})
.then(datas => { 
    // 상품 등록 시 상품 이름 셀렉트 창의 옵션
    let productName = "";
    //상품 등록 시 상품 단가 셀렉트 창의 옵션
    let productPrice = "";
    // 데이터 처리 로직
    datas.forEach(data =>{
        productName+=
            '<option value="' + data.p_name + '">' + data.p_name + '</option>';
        
        productPrice +=
            '<option value="' + data.p_price + '" id="' +data.p_name  + '">' + data.p_price + '</option>';          
    });
    // 이름 셀렉트 태그
    let selectBoxN = document.getElementById("pNameSelect");
    selectBoxN.innerHTML = productName;
    // 가격 셀렉트 태그
    let selectBoxP = document.getElementById("pPriceSelect");
    selectBoxP.innerHTML = productPrice; 
})
.catch(error => {
    console.error('네트워크 요청 실패:', error);
});
}

//버튼  교체 함수(재고관리 모달창의 폐기와 수정 기능이 자꾸 쌓이는거 방지하기 위함)
function replaceButton(button) {
let newButton = button.cloneNode(true);
button.parentNode.replaceChild(newButton, button);
return newButton;
}