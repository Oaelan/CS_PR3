/**
 * 메인 스크립트
 * 
 */

//실행 이벤트 리스너
	document.addEventListener("DOMContentLoaded", function() {
	    fetchOrderList()
	        .then(data => {
                    populateOrderTable(data);
                    
                    // 최신순 날짜 정렬
                    document.getElementById('sortDateAsc').addEventListener('click', function() {
                        const sortedData = [...data].sort((a, b) => new Date(a.o_date) - new Date(b.o_date));
                        populateOrderTable(sortedData);
                    });

                 	// 등록순 날짜 정렬
                    document.getElementById('sortDateDesc').addEventListener('click', function() {
                        const sortedData = [...data].sort((a, b) => new Date(b.o_date) - new Date(a.o_date));
                        populateOrderTable(sortedData);
                    });
                 	

                 	// 모두 보기
                    document.getElementById('All').addEventListener('click', function() {
                        populateOrderTable(data);
                    });

                 	
                 	// 수락 우선 정렬 필터링
                    document.getElementById('filterAccept').addEventListener('click', function() {
                        const filteredData = data.filter(order => order.o_permit === true);
                        populateOrderTable(filteredData);
                    });

                 	// 거절 우선 정렬 필터링
                    document.getElementById('filterReject').addEventListener('click', function() {
                        const filteredData = data.filter(order => order.o_permit === false);
                        populateOrderTable(filteredData);
                    });

                 	// 대기 우선 정렬 필터링
                    document.getElementById('filterPend').addEventListener('click', function() {
                        const filteredData = data.filter(order => order.o_permit === null);
                        populateOrderTable(filteredData);
                    });
                })
	        .catch(error => console.error('Error handling data:', error));
	});