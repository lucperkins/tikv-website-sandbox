function navbarToggle() {
  $(".navbar-burger").click(function() {
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });
}

$(function() {
  navbarToggle();

  console.log("Welcome to the TiKV docs!");
});
