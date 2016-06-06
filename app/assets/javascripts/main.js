$(document).ready(function(){
  getLinks();
});

function getLinks(){
  $.getJSON('api/v1/links', function(links){
    $.each(links, function(index, link){
      $(".ideas").append(
        cardViews(idea)
      );
    });
  });
}
