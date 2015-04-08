$(".edit_button").click(function (event) {
  event.preventDefault();
  var href = this.href.split("/");
  var ReviewId = href[href.length - 2];
  if (this.text == "Edit Review") {
    var RatingString = $("#review_rating" + ReviewId).text().split(" ");
    var description = $("#review_description" + ReviewId).text();
    var rating = RatingString[RatingString.length - 1][0];

    $(".review_item" + ReviewId).remove();
    $(".column#rating" + ReviewId).append(SelectBox(rating, ReviewId));
    $(".column#description" + ReviewId).append(TextBox(description, ReviewId));
    this.text = "Resubmit Review";
  } else {
    var NewRating = $("#edit_rating" + ReviewId).val();
    var NewDescription = $("#edit_description" + ReviewId).val();
    $("#edit_description" + ReviewId).remove();
    $("#edit_rating" + ReviewId).remove();
    $(".column#rating" + ReviewId).append(ReloadRating(NewRating, ReviewId));
    $(".column#description" + ReviewId).append(ReloadDescription(NewDescription, ReviewId));
    this.text = "Edit Review";
    $.ajax({
      type: "PUT",
      url: "/reviews/" + ReviewId,
      dataType: "json",
      data: { review: { rating: NewRating, description: NewDescription } }
    });
  }
});

function SelectBox(value, id){
  var html = "<select class='.review_item" + id + "' id='edit_rating" + id + "'>";
  for (var i = 1; i < 11; i++) {
    if (Number(value) === i) {
      html += "<option value ='" + i + "' selected>" + i + "</option>";
    } else {
      html += "<option value =" + i + ">" + i + "</option>";
    }
  }
  html += "</select>";
  return html;
};

function TextBox(details, id){
  var html = "<textarea class='.review_item" + id;
  html += "' id='edit_description" + id + "'>" + details + "</textarea>";
  return html;
};

function ReloadRating(NewRating, id){
  var html = "<p class='review_item" + id + "' id= 'review_rating" + id + "'>";
  html += "Rating: " + NewRating + "/10</p>";
  return html;
};

function ReloadDescription(NewDescription, id){
  var html = "<p class='review_item" + id + "' id= 'review_description" + id + "'>";
  html += NewDescription + "</p>";
  return html;
};
