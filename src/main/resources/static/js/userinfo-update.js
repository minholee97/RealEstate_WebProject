$(function () {
    //2
    $.each(areaData.sido, function (idx, code) {
        //append를 이용하여 option 하위에 붙여넣음
        $('#sido2').append(fn_option(code.sido, code.codeNm));
    });

    //sido 변경시 시군구 option 추가
    $('#sido2').change(function () {
        $('#sigugun2').show();
        $('#sigugun2').empty();
        $('#sigugun2').append(fn_option('', '선택')); //
        $.each(areaData.sigugun, function (idx, code) {
            if ($('#sido2 > option:selected').val() == code.sido)
                $('#sigugun2').append(fn_option(code.sigugun, code.codeNm));
        });

        //세종특별자치시 예외처리
        //옵션값을 읽어 비교
        if ($('#sido2 option:selected').val() == '36') {
            $('#sigugun2').hide();
            //index를 이용해서 selected 속성(attr)추가
            //기본 선택 옵션이 최상위로 index 0을 가짐
            $('#sigugun2 option:eq(1)').attr('selected', 'selected');
            //trigger를 이용해 change 실행
            $('#sigugun2').trigger('change');
        }
    });

    //시군구 변경시 행정동 옵션추가
    $('#sigugun2').change(function () {
        //option 제거
        $('#dong2').empty();
        $.each(areaData.dong, function (idx, code) {
            if ($('#sido2 > option:selected').val() == code.sido && $('#sigugun2 > option:selected').val() == code.sigugun)
                $('#dong2').append(fn_option(code.dong, code.codeNm));
        });
        //option의 맨앞에 추가
        $('#dong2').prepend(fn_option('', '선택'));
        //option중 선택을 기본으로 선택
        $('#dong2 option:eq("")').attr('selected', 'selected');

    });

});

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}
