import $ from "jquery";

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

require("bootstrap-icons/font/bootstrap-icons.css");

$(document).on("click", ".js-switch-locale", function () {
  const locale = $(this).data("locale");
  document.cookie = `locale=${locale}`;
  window.location.reload();
});
