    getProductList();

    // 등록 상품 리스트를 불러오는 함수
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
            // 전체 상품 리스트
            //console.log(productLists); // 데이터를 처리       
            // 상품 리스트들이 들어갈 tbody
            let tbody = document.getElementById("pList");
            // tbody 초기화
            tbody.innerHTML = "";       
            // 상품 리스트 forEach 돌려서 출력
            productLists.forEach(product => {         
                // 상품 정보를 담는 변수 
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
                        'data-target="#stockModal">' +
                        '재고관리' +
                        '</button>' +
                    '</td>' +
                    '</tr>';             
                // 등록되어 있는 상품을 tbody에 담아서 출력
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

    


       
    
    
    // 재고관리 버튼에 이벤트 추가 함수
    // 재고관리 버튼 이벤트 추가 해당 상품의 p_no 넘겨주고 유통기한별 상품 정보 가져오기
    function groupByDate(buttons) {
        // 선택한 상품의 코드를 담을 변수
        let p_no;

        buttons.forEach(button => {
            button.addEventListener("click", () => {
                // 선택할 상품의 코드 초기화
                p_no = button.id;

                // 선택한 상품의 코드로 유통기한별 재고 수 들고오기
                fetch('/product/groupByDate?p_no=' + p_no, {
                    headers: {
                        'Accept': 'application/json' // JSON 응답 요청
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('리스폰 타입 확인');
                    }
                    return response.json(); // 응답을 JSON 형식으로 변환
                })
                .then(products => {
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
                        //재고 관리 모달창 타이틀에 해당 상품명 넣을거임
                        let stockModalLabel = document.getElementById("stockModalLabel");
                        stockModalLabel.innerHTML = product.p_name;
                        groupByDateHtml +=
                            '<div class="stockCont">' +
                            '<input type="checkbox" class="mb-0 checkB stockList name="disposeStock" id="'+product.m_date+'">'+
                            '<input type="text" hidden class="mb-0 nonB stockList" name="p_no" value="' + product.p_no + '" readonly>' +
                            '<input type="text" class="mb-0 nonB stockList" name="m_date" value="' + product.m_date + '" readonly>' +
                            '<input type="text" class="mb-0 nonB stockList" name="p_limitD" value="' + product.p_limitD + '" readonly>' +
                            '<input type="text" class="mb-0 stockList updateBtn m_num" id="' + limitDateId + '" name="m_num" value="' + product.m_num + '" readonly>' +
                            '</div>'; // input id값이 유통기한                 
                    });  
                    //재고 수정 기능 호출
                    
                    
                    // 모달 창에 가져온 데이터 넣기
                    stockProduct.innerHTML = groupByDateHtml;
                    
                    // 수정 기능을 위한 변수(재고관리 모달창에 존재하는 데이터들을 객체로 담을거임)
                    let stockConts = document.querySelectorAll(".stockCont"); 
                    // 수정 기능 함수 호출
                    updateInventNum(stockConts);
                    
                    // input 태그 선택
                    let updateBtns = document.querySelectorAll(".updateBtn");
                    isReadonly(updateBtns)
                    
                    // 폐기 기능 호출 함수                  
                    disposeStock(stockConts);
                })
                .catch(error => {
                    console.error('컨트롤러 확인 또는 패치 헤더 확인', error); // 오류를 처리
                });
            });
        });
    }

    
    
    // 재고관리 모달에 있는 input에 이벤트 추가
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

    //폐기 기능 
    function disposeStock(stockConts){
        //모달창에 있는 상품정보를 담는 변수
        let beforeDisProducts = [];
        // 반복문을 통해 위의 객체를 채워넣어줌
        stockConts.forEach(cont => {
            let disproduct = {
                p_no: cont.querySelector('input[name="p_no"]').value,
                m_date: cont.querySelector('input[name="m_date"]').value,
                p_limitD: cont.querySelector('input[name="p_limitD"]').value,
                m_num: cont.querySelector('input[name="m_num"]').value
            };
            beforeDisProducts.push(disproduct);          
        });
        //재고 폐기 버튼
        let discardButton = document.getElementById("discardButton");
        // 수정 기능 추가
        discardButton.addEventListener("click",()=>{        
        // checkbox 
        let checkboxes = document.querySelectorAll(".checkB");
        // 폐기 처리할 데이터 정보 담는 변수
        let disposeProducts =[];
        for(i=0; i<checkboxes.length;i++){
            if(checkboxes[i].checked){
            disposeProducts.push(beforeDisProducts[i])
                }
            // 폐기 패치문 호출 하기                 
            }disposeStockFetch(disposeProducts); 
            // jQuery를 사용하여 모달 닫기
            $('#stockModal').modal('hide'); // 모달 숨기기
            // 페이지 새로 고침
            location.reload(); // 페이지 즉시 새로 고침(변경된 재고 수 웹 브라우저에 실시간 반영을 위함)
        });
    }
    
    // 재고 수정 기능
    function updateInventNum(stockConts){
        //수정할 재고들을 담을 변수
        let products = [];
        
        // 담을 변수 정보 
        stockConts.forEach(cont => {
            let product = {
                p_no: cont.querySelector('input[name="p_no"]').value,
                m_date: cont.querySelector('input[name="m_date"]').value,
                p_limitD: cont.querySelector('input[name="p_limitD"]').value,
                m_num: cont.querySelector('input[name="m_num"]').value
            };
            products.push(product);          
        }); //console.log(products)
        //재고 수정 버튼
        let editButton = document.getElementById("editButton");
        // 수정 기능 추가
        editButton.addEventListener("click",()=>{
        //재고관리 모달을 띄운 후 수정버튼을 클릭했을 때 인풋값 한번더 들고옴
        // 위의 객체에서 담은 이전 갯수와 비교하기 위함
        let proudctsNum = document.querySelectorAll(".m_num");
        //조건식에 만족하여 수정할 쿼리문만 선택하여 담는 객체
        let updatePro = [];
        for(i=0; i<proudctsNum.length; i++){
            if(proudctsNum[i].value != products[i].m_num){              
                //재고 수를 변경 했다면 원래 재고 객체에 바뀐 재고 수로 초기화
                products[i].m_num = proudctsNum[i].value;
                //수정할 쿼리문만 담기
                updatePro.push(products[i]);
                } 
            };
            // 수정 패치 호출 해서 updatePro 던져주기
            updateInventFetch(updatePro);
            // jQuery를 사용하여 모달 닫기
            $('#stockModal').modal('hide'); // 모달 숨기기
            // 페이지 새로 고침
            location.reload(); // 페이지 즉시 새로 고침(변경된 재고수 웹 브라우저에 실시간 반영을 위함)
        });
    }
    
    // 재고 수정 fetch 함수
    function updateInventFetch(updatePro){
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

    // 재고 수정 fetch 함수
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
