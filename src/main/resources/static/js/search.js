$(function () {
    var apt_list = [];
    var jibun_list = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var searchType = localStorage.getItem("keyword");
    if (searchType) {
        var keyword = searchType;
        var type = localStorage.getItem("type");
        localStorage.removeItem("keyword");
        localStorage.removeItem("type");

    } else {
        var dongCode = localStorage.getItem("dongCode");
        var type = localStorage.getItem("type");
        localStorage.removeItem("dongCode");
        localStorage.removeItem("type");
        var sido_ = dongCode.substring(1, 3);
        var sigugun_ = dongCode.substring(3, 6);
        var dong_ = dongCode.substring(6, 9);
        var dongName;
        var address = "";

        areaData.sido.forEach(function (item) {
            if (item.sido == sido_)
                address += item.codeNm;
        });

        areaData.sigugun.forEach(function (item) {
            if (item.sido == sido_ && item.sigugun == sigugun_)
                address += " " + item.codeNm;
        });

        areaData.dong.forEach(function (item) {
            if (item.sido == sido_ && item.sigugun == sigugun_ && item.dong == dong_) {
                dongName = item.codeNm;
                address += " " + item.codeNm;
            }
        });

        $('#sido2').val(sido_);
        $('#sigugun2').append(fn_option('', '선택')); //
        $.each(areaData.sigugun, function (idx, code) {
            if ($('#sido2 > option:selected').val() == code.sido)
                $('#sigugun2').append(fn_option(code.sigugun, code.codeNm));
        });
        if ($('#sido2 option:selected').val() == '36') {
            $('#sigugun2').hide();
            //index를 이용해서 selected 속성(attr)추가
            //기본 선택 옵션이 최상위로 index 0을 가짐
            $('#sigugun2 option:eq(1)').attr('selected', 'selected');
            //trigger를 이용해 change 실행
            $('#sigugun2').trigger('change');
        }
        $('#sigugun2').val(sigugun_);
        $.each(areaData.dong, function (idx, code) {
            if ($('#sido2 > option:selected').val() == code.sido && $('#sigugun2 > option:selected').val() == code.sigugun)
                $('#dong2').append(fn_option(code.dong, code.codeNm));
        });
        //option의 맨앞에 추가
        $('#dong2').prepend(fn_option('', '선택'));
        //option중 선택을 기본으로 선택
        $('#dong2 option:eq("")').attr('selected', 'selected');
        $('#dong2').val(dong_);
        apt_list.splice(0, apt_list.length);
        jibun_list.splice(0, jibun_list.length);
        //ps.keywordSearch('서울특별시 종로구 창신 창신쌍용', placesSearchCB);
        if (!type.includes("1")) { // 아파트매매
            $.ajax({
                type: "GET",
                url: "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?LAWD_CD=" + dongCode.substring(1, 6) +
                    "&DEAL_YMD=202112&serviceKey=7lqRNadVRfvuITI5XrPRHiTOe0Wnx6EF3UErkngTN8UMi2oLSlFpTE5F9r%2FsfmSsD18D41m2LbMGjt%2BF0riN9Q%3D%3D",
                data: {},
                success: function (data) {
                    $(data).find('item').each(function (index) {
                        var money = $(this).find('거래금액').text();
                        var bd_year = $(this).find('건축년도').text();
                        var tr_year = $(this).find('년').text();
                        var tr_month = $(this).find('월').text();
                        var tr_day = $(this).find('일').text();
                        var jibun = $(this).find('지번').text();
                        var jicode = $(this).find('지역코드').text();
                        var apt_name = $(this).find('아파트').text();
                        var code = $(this).find('법정동').text();
                        if (code.substring(0, 3).includes(dongName.substring(0, 2))) {
                            apt_list.push(apt_name);
                            fn_map(map, geocoder, address + " " + jibun, apt_name);
                            jibun_list.push(jibun);
                            $('#houselist').append("<div class='container p-3 my-3 border'>" + apt_name + "</div>")
                        }
                    });
                    // 거래금액
                    // 거래유형
                    // 건축년도
                    // 년
                    // 법정동
                    // 아파트
                    // 월
                    // 일
                    // 전용면적
                    // 중개사소재지
                    // 지번
                    // 지역코드
                    // 층
                    // 해제사유발생일
                    // 해제여부
                }
            });
        }
        if (!type.includes("2")) { // 전월세
            $.ajax({
                type: "GET",
                url: "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptRent?LAWD_CD=" + dongCode.substring(1, 6) +
                    "&DEAL_YMD=201512&serviceKey=7lqRNadVRfvuITI5XrPRHiTOe0Wnx6EF3UErkngTN8UMi2oLSlFpTE5F9r%2FsfmSsD18D41m2LbMGjt%2BF0riN9Q%3D%3D",
                data: {},
                success: function (data) {
                    $(data).find('item').each(function (index) {
                        var money = $(this).find('거래금액').text();
                        var bd_year = $(this).find('건축년도').text();
                        var tr_year = $(this).find('년').text();
                        var tr_month = $(this).find('월').text();
                        var tr_day = $(this).find('일').text();
                        var jibun = $(this).find('지번').text();
                        var apt_name = $(this).find('아파트').text();
                        var code = $(this).find('법정동').text();
                        if (code.substring(0, 3).includes(dongName.substring(0, 2))) {
                            apt_list.push(apt_name);

                            fn_map(map, geocoder, address + " " + jibun, apt_name);
                            jibun_list.push(jibun);

                            $('#houselist').append("<div class='container p-3 my-3 border'>" + apt_name + "</div>")
                        }
                    });
                }
            });
        }
    }
});

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}

function fn_map(map, geocoder, str, aptname) {
    geocoder.addressSearch(str, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + aptname + '</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        };
    });
};