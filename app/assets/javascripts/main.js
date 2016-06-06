$(document).ready(function(){
  getLinks();
});

function getLinks(){
  $.getJSON('api/v1/links', function(links){
    $.each(links, function(index, link){
      $(".all-links").append(
        "Title: " + link.title + "<br>" +
        "Url: " + link.url + "<br>" +
        "Read? " + link.read + "<br> <br>"
      );
    });
  });
}
