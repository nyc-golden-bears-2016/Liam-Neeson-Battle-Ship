$( document ).ready(function() {
  $('.shotform').on('submit', function(event){
    $.ajax({
      url: $(this).attr('action'),
      method: "POST",
      data: $(this).serialize()
    }).done(function(response){
      var shot = JSON.parse(response);
      var x = shot["row"];
      var y = shot['column'];
      if (shot["hit"] === true){
        $("." + x + " ." + y).addClass('hit');
      } else {
        $("." + x + " ." + y).addClass('miss');
      }
    });
  });
});