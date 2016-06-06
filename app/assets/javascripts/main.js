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
      if (link.read){ //read is true
        buttonReadContent = "<button id=read-" + link.id + " class='unread-link'> Mark as Unread </button>";
        linkStyle = "color:#0000FF";
        readOrUnread = "Already perused it";
      }
      else { //read is false
        buttonReadContent = "<button id=read-" + link.id + " class='read-link'> Mark as Read </button>";
        linkStyle = "color:#FF0000";
        readOrUnread = "Unread";
      }
      $(".all-links").append(
        "<div class=links>" +
          "<p class=link-title>Title: " + link.title + "</p><br>" +
          "<p class=link-url style=" + linkStyle + " id=url-" + link.id + ">Url: " + link.url + "</p><br>" +
          "<p class=link-read>" + readOrUnread + "</p><br>" +
          buttonReadContent + "<br><br>" +
        "</div>"
      );
    });
  });
}

// "<a href='/links/" + link.id +  "/edit'>Edit!</a>"

function unreadToRead(){
  var id = getId($(this).attr("id"));
  var link = { link: { read: true }};
  $.ajax({
    url: "/api/v1/links/"+ id,
    method: "PUT",
    dataType: "json",
    data: link,
    success: function(){
      $(".all-links").empty();
      getLinks();
      // $("#read-" + id).text("Mark AS UNREAD");
      // $("#url-" + id).css("color", "red");
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
      $(".all-links").empty();
      getLinks();
      // $("#read-" + id).text("Mark AS READ");
      // $("#url-" + id).css("color", "blue");
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
