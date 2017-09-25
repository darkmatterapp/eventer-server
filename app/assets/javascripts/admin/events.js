$(document).on('turbolinks:load', function() {
  $("#event_start_date").datetimepicker({
    timepicker:false,
    format:'Y-m-d',
    scrollMonth:false,
    onChangeDateTime:function(dp,$input){
      $(this).val($input.val());
    }
  });

  $("#event_end_date").datetimepicker({
    timepicker:false,
    format:'Y-m-d',
    scrollMonth:false,
    onChangeDateTime:function(dp,$input){
      $(this).val($input.val());
    }
  });
});
