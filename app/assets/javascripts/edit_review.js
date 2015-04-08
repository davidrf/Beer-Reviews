$(".edit_button").click(function (event) {
  event.preventDefault();
  var href = this.href.split("/");
  var review_id = href[href.length - 2];
  if (this.text == "Edit Review") {
    var rating_string = $('#review_rating' + review_id).text().split(" ");
    var description = $('#review_description' + review_id).text();
    var rating = rating_string[rating_string.length - 1][0];

    $('.review_item' + review_id).remove();
    $('.column#rating' + review_id).append(select_box(rating, review_id));
    $('.column#description' + review_id).append(text_box(description, review_id));
    this.text = "Resubmit Review";
  } else {
    var new_rating = $("#edit_rating" + review_id).val();
    var new_description = $("#edit_description" + review_id).val();
    $('#edit_description' + review_id).remove();
    $('#edit_rating' + review_id).remove();
    $('.column#rating' + review_id).append(reload_rating(new_rating, review_id));
    $('.column#description' + review_id).append(reload_description(new_description, review_id));
    this.text = "Edit Review"
    $.ajax({
      type: "PUT",
      url: "/reviews/" + review_id,
      dataType: 'json',
      data: { review: { rating: new_rating, description: new_description } }
    })
  }
});

function select_box(value, id){
  var html = "<select class='.review_item" + id + "' id='edit_rating" + id + "'>"
  for (var i = 1; i < 11; i++) {
    if (Number(value) === i) {
      html += "<option value ='" + i + "' selected>" + i + "</option>"
    } else {
      html += "<option value =" + i + ">" + i + "</option>"
    }
  }
  html += "</select>"
  return html;
};

function text_box(details, id){
  var html = "<textarea class='.review_item" + id
  html += "' id='edit_description" + id + "'>" + details + "</textarea>"
  return html;
};

function reload_rating(new_rating, id){
  var html = "<p class='review_item" + id + "' id= 'review_rating" + id + "'>"
  html += "Rating: " + new_rating + "/10</p>"
  return html;
};

function reload_description(new_description, id){
  var html = "<p class='review_item" + id + "' id= 'review_description" + id + "'>"
  html += new_description + "</p>"
  return html;
};
