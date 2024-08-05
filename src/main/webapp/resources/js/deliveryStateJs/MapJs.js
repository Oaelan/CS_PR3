/**
 * 지도 관련 함수
 * 
 */

// 지도 업데이트 함수
    function updateMap(dlv) {
        const mapContainer = document.getElementById('map'); // 지도를 표시할 div
        const mapOption = {
            center: new kakao.maps.LatLng(dlv.x, dlv.y), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        // 지도 객체를 생성하거나 업데이트
        let map = new kakao.maps.Map(mapContainer, mapOption);
        let marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(dlv.x, dlv.y)
        });
        marker.setMap(map);

        // 지도와 마커를 주기적으로 갱신
        setInterval(async function() {
            // 주기적으로 데이터 가져오기
            const data = await fetchDlvList();
            const updatedDlv = data.find(d => d.d_no === dlv.d_no); // 현재 클릭된 d_no에 해당하는 데이터 가져오기

            if (updatedDlv) {
            	var moveLatLon = new kakao.maps.LatLng(updatedDlv.x, updatedDlv.y);
                map.panTo(moveLatLon);     
                marker.setPosition(new kakao.maps.LatLng(updatedDlv.x, updatedDlv.y));
            }
        }, 1000);
    }