function searchField(){
  $("#filter").change(function(){
    var filter = $(this).val();
    $(".links").each(function(index, link){
      var title = $(link).find(".link-title").text();
      var url = $(link).find(".link-url").text();
      var read = $(link).find(".link-read").text();
      title.match(filter) || url.match(filter) || read.match(filter) ? $(link).show() : $(link).hide()
    });
  })
  .keyup(function(){
    $(this).change();
  });
}
