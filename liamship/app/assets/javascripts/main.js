$(document).ready(function(){
  setInterval(ajaxTurn, 1000) ;

  function ajaxTurn() {
    $.ajax({
      url: "/games/" + $('#game_id').val() + '/turn'
    })
    .done(function(response) {
      if(response === true){
        $('.shotform').show();
      }
      else if(response === false){
        $(".shotform").hide();
      }
    })
    }
})
