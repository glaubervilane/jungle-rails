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
//= require bootstrap-sprockets
//= require_tree .
// Wait for the document to be ready
document.addEventListener("turbolinks:load", function () {
  // Find the parent element that remains constant during navigation
  const adminDashboard = document.getElementById("adminDashboard");

  // Find the button and categories list by their IDs
  const toggleButton = document.getElementById("toggleCategories");
  const categoriesList = document.getElementById("categoriesList");

  // Add a click event listener to the parent element
  adminDashboard.addEventListener("click", function (event) {
    // Check if the clicked element is the toggle button
    if (event.target === toggleButton) {
      // Toggle the visibility of the categories list
      if (categoriesList.style.display === "none") {
        categoriesList.style.display = "block";
      } else {
        categoriesList.style.display = "none";
      }
    }
  });
});