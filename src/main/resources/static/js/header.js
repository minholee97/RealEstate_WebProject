$(function () {

  // 검색 드롭다운 구성 시작
  $.each(areaData.sido, function (idx, code) {
    $('#sido').append(fn_option(code.sido, code.codeNm));
  });

  $('#sido').change(function () {
    $('#sigugun').show();
    $('#sigugun').empty();
    $('#sigugun').append(fn_option('', '선택'));
    $.each(areaData.sigugun, function (idx, code) {
      if ($('#sido > option:selected').val() == code.sido)
        $('#sigugun').append(fn_option(code.sigugun, code.codeNm));
    });
    if ($('#sido option:selected').val() == '36') {
      $('#sigugun').hide();
      $('#sigugun option:eq(1)').attr('selected', 'selected');
      $('#sigugun').trigger('change');
    }
  });
  
  $('#sigugun').change(function () {
    $('#dong').empty();
    $.each(areaData.dong, function (idx, code) {
      if ($('#sido > option:selected').val() == code.sido && $('#sigugun > option:selected').val() == code.sigugun)
        $('#dong').append(fn_option(code.dong, code.codeNm));
    });
    $('#dong').prepend(fn_option('', '선택'));
    $('#dong option:eq("")').attr('selected', 'selected');
  });
  //검색 드롭다운 구성 끝

});

function fn_option(code, name) {
  return '<option value="' + code + '">' + name + '</option>';
}
