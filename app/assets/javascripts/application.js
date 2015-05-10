// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function () {

  // grab the `entries-con`
  var $entriesCon = $("#entries-con");

  $.get("/entries.json")
    .done(function (entries) {
      console.log("All Entries:", entries);

      // append each entry
      entries.forEach(function (entry) {
        var completed = entry.completed ? "entry-completed" : "";
        var checked = entry.completed ? "checked" : "";
        $entriesCon.append("<div class=\"entry "+ completed + "\" data-id=" + entry.id + ">" + 
                        entry.food + 
                        "<input type=\"checkbox\" class=\"completed\" " + checked + ">" +
                        "<button class=\"delete\">Delete</button></div>");
      });

  });

  var $entryForm = $("#new_entry")
  $entryForm.on("submit", function (event) { 
    event.preventDefault();
    console.log("Form submitted", $(this).serialize());

    var food = $("#entry_food").val();
    $.post("/entries.json", {
      entry: {
        food: food
      }
    }).done(function (createdEntry) {
      var $entry = $("<div class=\"entry\" data-id=" + createdEntry.id + ">" + 
                    createdEntry.food + 
                    "<input type=\"checkbox\" class=\"completed\">" +
                    "<button class=\"delete\">Delete</button></div>");


      $entry.find(".completed").attr("checked", createdEntry.completed);

      if (createdEntry.completed) {
        $entry.toggleClass("entry-complete")
      }

      $entriesCon.append($entry);  
    });
  });

  // setup a click handler that only
  //  handle clicks from an element
  //  with the `.delete` className
  //  that is inside the $entriesCon
  $entriesCon.on("click", ".delete", function (event) {
    alert("Click to delete!");

    // grab the entire entry
    var $entry = $(this).closest(".entry");

    // send our delete request
    $.ajax({
      // grab the data-id attribute
      url: "/entries/" + $entry.data("id") + ".json",
      type: "DELETE"
    }).done(function (){
      // once we completed the delete
      $entry.remove();
    })
  });

  $entriesCon.on("click", ".completed", function () {

    var $entry = $(this).closest(".entry");

    $.ajax({
      url: "/entries/" + $entry.data("id") + ".json",
      type: "PUT",
      data: {
        entry: {
          completed: this.checked
        }
      }
    }).done(function (data) {
      // update the styling of our entry
      $entry.toggleClass("entry-complete")
    })
  });

});