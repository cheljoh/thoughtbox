$(document).ready(function(){
  getLinks();
  searchField();
  $("body").on("click", "button.read-link", unreadToRead);
  $("body").on("click", "button.unread-link", readToUnread);
});

function getLinks(){
  var buttonReadContent = "";
  var linkStyle = "";
  var readOrUnread = "";
  $.getJSON('api/v1/links', function(links){
    $.each(links, function(index, link){
      if (link.read){
        buttonReadContent = "<button id=read-" + link.id + " class='unread-link'> Mark as Unread </button>";
        linkStyle = "color:#0000FF";
        readOrUnread = "Already perused it";
      }
      else {
        buttonReadContent = "<button id=read-" + link.id + " class='read-link'> Mark as Read </button>";
        linkStyle = "color:#FF0000";
        readOrUnread = "Need to check it out";
      }
      $(".all-links").append(
        linkContent(link, readOrUnread, linkStyle, buttonReadContent)
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
      reloadLinks();
    },
    error: function(){
      console.log("Something went wrong");
    }
  });
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
      reloadLinks();
    },
    error: function(){
      console.log("Something went wrong");
    }
  });
}
