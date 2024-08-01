//물류 창고 온도 fetch 함수 실시간으로 온도 가져오기
async function selectFactoryTemp() {
    try {
        const response = await fetch('/product/selectFactoryTemp', {
            headers: {
                'Accept': 'application/json'
            }
        });

        const results = await response.json(); // 응답을 JSON으로 변환
        // 온도 데이터 들이보여질 div
        let tempList = document.getElementById("tempList");
        //가져온 온도 데이터들을 담을 변수
        let factoryTempListHTML = "";
        results.forEach(result => {
            factoryTempListHTML += 
                '<div class="warehouse-message" style="text-align: center; display:flex; justify-content: space-evenly; align-items: center;">' +
                '<p class="temp"> ' + result.now_temp + " °C</p>" +
                '<p class="time"> '+ result.time + "</p>" +
                '<p class="state"> ' + result.state + "</p>" +
                "</div>";
        });
        // 온도 데이터 div에 가져온 온도 데이터 넣어 출력
        tempList.innerHTML = factoryTempListHTML;
        
        let temps = document.querySelectorAll(".temp");
        temps.forEach(temp => {         
            let tempN = temp.innerText.slice(0, -2);
            if (parseFloat(tempN) <= 25.0) {
                temp.parentNode.style.color = "blue";
            } else if (parseFloat(tempN) >= 29.0) {
                temp.parentNode.style.color = "red";
            }
            temp.parentNode.style.fontWeight = "bold";   
        });
       
        let nowTemp = document.getElementById("nowTemp");
        nowTemp.innerText = "현재 창고 온도 : " + temps[0].innerText;
        let nowTempForM = parseFloat(temps[0].innerText.slice(0, -2));
   
        if (nowTempForM <= 25.0) {
            nowTemp.style.color = "blue";
        } else if (nowTempForM >= 29.0) {
            nowTemp.style.color = "red";
        } else {
            nowTemp.style.color = "black";
        }

        // nowTempForM 값을 반환
        return nowTempForM;
    } catch (error) {
        console.error('Error:', error); // 오류가 발생한 경우
    }
}


//실시간 온도 감지에 따라 생기는 토스트창 함수
async function toastForTem() {
  const nowTempForM  = await selectFactoryTemp();
  //console.log(nowTempForM)
  //토스트 메시지 창
  let toastHeader = document.getElementById("toast-header");
  toastHeader.innerHTML =" ";  
  // 토스트 메시지
  let tempState = document.getElementById("tempState");
  // 토스트 창 
  var toast = document.getElementById('toast');
  $(toast).toast({
      // x버튼을 눌러 닫기 전 까지 안 사라짐
    autohide: false 
  });
  
  if (nowTempForM !== undefined) {
      if(nowTempForM <=25){
          // 조건에 따라 토스트 메시지와 디자인 설정
          tempState.innerText  = "현재 온도가 낮습니다."
          toastHeader.style.background ="blue";
          toastHeader.style.color = 'white';    
          toastHeader.innerHTML =  '<i class="bi bi-thermometer-high rounded mr-2" aria-hidden="true"></i>' +
          '<strong class="mr-auto">물류 창고 온도 이상</strong>' +
          '<small class="temps">just now</small>' +
          '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">' +
          '<span aria-hidden="true">&times;</span>' +
          '</button>';
          $(toast).toast('show');
      }else if(nowTempForM >=29){
          // 조건에 따라 토스트 메시지와 디자인 설정
          tempState.innerText  = "현재 온도가 높습니다."
          toastHeader.style.background ="red";
          toastHeader.style.color = 'white';    
          toastHeader.innerHTML =  '<i class="bi bi-thermometer-high rounded mr-2" aria-hidden="true"></i>' +
          '<strong class="mr-auto">물류 창고 온도 이상</strong>' +
          '<small class="temps" >just now</small>' +
          '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">' +
          '<span aria-hidden="true">&times;</span>' +
          '</button>';
          $(toast).toast('show');
      }else{
          $(toast).toast('hide');
      }
  }
}









//온도 검색 옵션 요소 만드는 함수 (년/월/일)
async function TempSearchYMDO() {
  try {
      // fetch 요청을 보내고 응답을 JSON으로 변환
      const response = await fetch('/product/selectTempDate', {
          headers: {
              'Accept': 'application/json'  
          },
      });

      const results = await response.json();

      // 연도, 월, 일 각각의 배열을 초기화
      const years = [];
      const months = [];
      const days = [];
      
      // 중복을 방지하기 위한 Set 생성
      const uniqueYears = new Set();
      const uniqueMonths = new Set();
      const uniqueDays = new Set();
      
      results.forEach(result => {
          // 가져온 데이터의 년/월/일을 조건식으로 추출하여 위의 배열 초기화
          const date = new Date(result.time);
          let tYear = date.getFullYear();
          let tMonth = date.getMonth() + 1;
          let tDay = date.getDate();
          
          // 연도 중복 체크
          if (!uniqueYears.has(tYear)) {
              uniqueYears.add(tYear);
              years.push(tYear);
          }

          // 월 중복 체크
          if (!uniqueMonths.has(tMonth)) {
              uniqueMonths.add(tMonth);
              months.push(tMonth);
          }

          // 일 중복 체크
          if (!uniqueDays.has(tDay)) {
              uniqueDays.add(tDay);
              days.push(tDay);
          }
      });
      
      // 연도, 월, 일 배열만 포함된 객체를 반환
      return { years, months, days };
  } catch (error) {
      console.error('Error:', error); // 오류가 발생한 경우
      // 오류 발생 시 빈 배열을 포함한 객체 반환
      return { years: [], months: [], days: [] };
  }
}

async function createTempSearchYMDOptions() {
  try {
      // createTempSearchYMDOptions 함수를 호출하여 결과를 가져옴
      const { years, months, days } = await TempSearchYMDO();
      
      // 옵션을 추가할 년/월/일 select 박스
      let yearS = document.getElementById("year");
      let monthS = document.getElementById("month");
      let dayS = document.getElementById("day");
      let stateS = document.getElementById("state");
      // 셀렉트 박스에 옵션을 추가합니다
      years.forEach(year => {
          let yearOption = document.createElement('option');
          yearOption.innerText = year + "년";
          yearOption.value = year;
          yearS.appendChild(yearOption);
      });
      
      months.forEach(month => {
          let monthOption = document.createElement('option');
          monthOption.innerText = month + "월";
          monthOption.value = month;
          monthS.appendChild(monthOption);
      });
      
      days.forEach(day => {
          let dayOption = document.createElement('option');
          dayOption.innerText = day + "일";
          dayOption.value = day;
          dayS.appendChild(dayOption);
      });

      
      // change 후 년/월/일 value값을 담을 변수
      let y = null, m = null, d = null;  s=null;

      // 셀렉트 박스 change 이벤트 추가
      yearS.addEventListener("change", () => {
          y = yearS.value;
          searchTemByDate(y, m, d,s);
      });
      monthS.addEventListener("change", () => {
          m = monthS.value;
          searchTemByDate(y, m, d,s);
      });
      dayS.addEventListener("change", () => {
          d = dayS.value;
          //달이 선택되어 있을 경우만 호출
          if( m ){
              searchTemByDate(y,m,d,s)
              }
          });
      stateS.addEventListener("change", () => {
          s = stateS.value;
          searchTemByDate(y, m, d,s);
      });

      // 년/월/일 선택 시 온도 데이터 검색되는 fetch
      function searchTemByDate(y, m, d,s) {  
          // 입력값이 없으면 빈 문자열로 설정
          y = y ? String(y) : "";
          m = m ? String(m).padStart(2, '0') : "";
          d = d ? String(d).padStart(2, '0') : "";
          let searchDate = "";
          let state ="";
          // 연도가 선택되면 YYYY
          if (y) {
              searchDate += y;
          }

          // 월이 선택되면 YYYY-MM
          if (m) {
              searchDate += (searchDate ? '-' : '') + m;
          }

          // 일이 선택되면 YYYY-MM-DD
          if (d) {
              searchDate += (searchDate ? '-' : '') + d;
          }
          if(s){
              state = s;
          }
          // searchDate 값으로 데이터 조회하기    
           searchTemByDateFetch(searchDate,state);
      }
  } catch (error) {
      console.error('Error:', error); // 오류가 발생한 경우
  }
}


function searchTemByDateFetch(searchDate,state) {
  // URL 인코딩을 적용하여 특수 문자 처리
  const encodedSearchDate = encodeURIComponent(searchDate);
  const tempState = state;
  // GET 요청을 보낼 URL 구성
  const url = `/product/selectTempByDate?searchDate=${encodedSearchDate}&state=${tempState}`;

  // Fetch 요청 보내기
  fetch(url, {
      headers: {
          'Accept': 'application/json' 
      }
  })
  .then(response => {
      // 응답 상태 코드 확인
      if (!response.ok) {
          throw new Error(`${response.status}`);
      }
      return response.json(); // 응답을 JSON으로 변환
  })
  .then(results => {
      console.log(results);   
      // 온도 정보 리스트 출력하기
      // 온도 데이터 들이보여질 div
      let tempList = document.getElementById("tempList2");
      //가져온 온도 데이터들을 담을 변수
      let factoryTempListHTML = "";
      results.forEach(result => {
          factoryTempListHTML += 
              '<div class="warehouse-message" style="text-align: center; display:flex; justify-content: space-evenly; align-items: center;">' +
              '<p class="temp"> ' + result.now_temp + " °C</p>" +
              '<p class="time"> '+ result.time + "</p>" +
              '<p class="state"> ' + result.state + "</p>" +
              "</div>";
      });
      // 온도 데이터 div에 가져온 온도 데이터 넣어 출력
      tempList.innerHTML = factoryTempListHTML;
  })
  .catch(error => {
      console.error('Error:', error); // 오류가 발생한 경우
  });
}






