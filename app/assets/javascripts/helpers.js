function getId(id){
  var getNumbers = /\d+/;
  var cleanedId = (id.match(getNumbers))[0];
  return cleanedId;
}

function reloadLinks(){
  $(".all-links").empty();
  getLinks();
  $('html,body').animate({
    scrollTop: $(".all-links").offset().top
  });
}

function linkContent(link, readOrUnread, linkStyle, buttonReadContent){
  return "<div class=links>" +
    "<div class=link-title>Title: " + link.title + "</div><br>" +
    "<div class=link-url style=" + linkStyle + " id=url-" + link.id + ">Url: " + link.url + "</div><br>" +
    "<div class=link-read>" + readOrUnread + "</div><br>" +
    "<a href='/links/" + link.id +  "/edit' class=btn>Edit!</a> <br><br>" +
    buttonReadContent + "<br><br>" +
  "</div>";
}
