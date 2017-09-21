$(function() {
  $("#session_starts_at").datetimepicker({
    format:'Y-m-d H:i',
    scrollMonth:false,
    onChangeDateTime:function(dp,$input){
      $(this).val($input.val());
      $("#session_ends_at").val($input.val());
    }
  });

  $("#session_ends_at").datetimepicker({
    format:'Y-m-d H:i',
    scrollMonth:false,
    onChangeDateTime:function(dp,$input){
      $(this).val($input.val());
    }
  });
});
