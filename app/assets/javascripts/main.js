$(document).ready(function(){
  getLinks();
  $("body").on("click", "button.read-link", unreadToRead);
  $("body").on("click", "button.unread-link", readToUnread);
});

function getLinks(){
  var buttonReadContent = "";
  $.getJSON('api/v1/links', function(links){
    $.each(links, function(index, link){
      if (link.read){ //read is true
        buttonReadContent = "<button id=unread-" + link.id + " class='unread-link'> Mark as Unread </button> <br><br>";
      }
      else { //read is false
        buttonReadContent = "<button id=read-" + link.id + " class='read-link'> Mark as Read </button>";
      }
      $(".all-links").append(
        "Title: " + link.title + "<br>" +
        "Url: " + link.url + "<br>" +
        "Read? " + link.read + "<br>" +
        buttonReadContent + "<br><br>"
      );
    });
  });
}

function unreadToRead(){
  var id = getId($(this).attr("id"));
  var link = { link: { read: true }};
  $.ajax({
    url: "/api/v1/links/"+ id,
    method: "PUT",
    dataType: "json",
    data: link,
    success: function(){
      updateLinkToRead(id);
    },
    error: function(){
      console.log("Something went wrong");
    }
  });
}

function updateLinkToRead(id){
  $("#read-" + id).text("Mark As Read");
}

function updateLinkToUnread(id){
  $("#unread-" + id).text("Mark As Unread");
}

function readToUnread(){
  var id = getId($(this).attr("id"));
  var link = { link: { read: false }};
  $.ajax({
    url: "/api/v1/links/"+ id,
    method: "PUT",
    dataType: "json",
    data: link,
    success: function(){
      updateLinkToUnread(id);
    },
    error: function(){
      console.log("Something went wrong");
    }
  });
}

function getId(id){
  var getNumbers = /\d+/;
  var cleanedId = (id.match(getNumbers))[0];
  return cleanedId;
}
