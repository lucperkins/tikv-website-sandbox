function navbarToggle() {
  $(".navbar-burger").click(function() {
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });
}

function scrollOffset() {
  $('.content a').click(function() {
    window.alert("OK!");
  });
}

$(function() {
  navbarToggle();
  scrollOffset();

  console.log("Welcome to the TiKV docs!");
});
