$(".vote-arrow").click(function (event) {
  event.preventDefault();
  var href = this.href.split("/");
  var ReviewId = href[href.length - 2];
  var path = href.slice(Math.max(href.length - 3, 1))
  path = "/" + path.join("/")

  $.ajax({
    type: "POST",
    url: path,
    dataType: "json"
  })
    .done(function ( data ) {
      $('#upvote_count' + ReviewId).text(data + " beer(s) on the wall");
    });
  return false;
});
