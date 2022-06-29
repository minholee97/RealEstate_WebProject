$(function () {
    $.each(areaData.sido, function (idx, code) {
        $('#sido2').append(fn_option(code.sido, code.codeNm));
    });

    $('#sido2').change(function () {
        $('#sigugun2').show();
        $('#sigugun2').empty();
        $('#sigugun2').append(fn_option('', '선택')); //
        $.each(areaData.sigugun, function (idx, code) {
            if ($('#sido2 > option:selected').val() == code.sido)
                $('#sigugun2').append(fn_option(code.sigugun, code.codeNm));
        });

        if ($('#sido2 option:selected').val() == '36') {
            $('#sigugun2').hide();
            $('#sigugun2 option:eq(1)').attr('selected', 'selected');
            $('#sigugun2').trigger('change');
        }
    });


    $('#sigugun2').change(function () {
        $('#dong2').empty();
        $.each(areaData.dong, function (idx, code) {
            if ($('#sido2 > option:selected').val() == code.sido && $('#sigugun2 > option:selected').val() == code.sigugun)
                $('#dong2').append(fn_option(code.dong, code.codeNm));
        });
        $('#dong2').prepend(fn_option('', '선택'));
        $('#dong2 option:eq("")').attr('selected', 'selected');
    });

});

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}