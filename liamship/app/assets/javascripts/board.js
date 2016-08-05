$( document ).ready(function() {
  $('.shotform').on('submit', 'form', function(event){
    $.ajax({
      url: $(this).attr('action'),
      method: "POST",
      data: $(event.target).serialize()
    }).done(function(response){
      debugger;
      var x = response.coordinate.row;
      var y = response.coordinate.column;
      if (response.hit === true){
        $("." + x + " ." + y).addClass('hit');
      } else {
        $("." + x + " ." + y).addClass('miss');
      }
    });
  });
});