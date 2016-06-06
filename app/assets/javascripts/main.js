$(document).ready(function(){
  // getLinks();
  $("body").on("click", "button.read-link", unreadToRead);
  $("body").on("click", "button.unread-link", readToUnread);
});

// function getLinks(){
//   var buttonReadContent = "";
//   $.getJSON('api/v1/links', function(links){
//     $.each(links, function(index, link){
//       if (link.read){ //read is true
//         buttonReadContent = "<button id=read-" + link.id + " class='unread-link'> Mark as Unread </button>";
//         linkStyle = "color:#0000FF";
//       }
//       else { //read is false
//         buttonReadContent = "<button id=read-" + link.id + " class='read-link'> Mark as Read </button>";
//         linkStyle = "color:#FF0000";
//       }
//       $(".all-links").append(
//         "<p>Title: " + link.title + "</p><br>" +
//         "<p style=" + linkStyle + " id=url-" + link.id + ">Url: " + link.url + "</p><br>" +
//         buttonReadContent + "<br><br>"
//       );
//     });
//   });
// }

function unreadToRead(){
  var id = getId($(this).attr("id"));
  var link = { link: { read: true }};
  $.ajax({
    url: "/api/v1/links/"+ id,
    method: "PUT",
    dataType: "json",
    data: link,
    success: function(){
      // $(".all-links").empty();
      // getLinks();
      $("#read-" + id).text("Mark AS UNREAD");
      $("#url-" + id).css("color", "red");
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
      // $(".all-links").empty();
      // getLinks();
      $("#read-" + id).text("Mark AS READ");
      $("#url-" + id).css("color", "blue");
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
