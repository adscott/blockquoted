(function () {
  $(window).bind('popstate', function() {
    blockquoted.loader.displayQuote();
  });

  $(document).ready(function () {
    blockquoted.loader.displayQuote();
  });

  $('#another').click(function (e) {
    e.preventDefault();
    blockquoted.loader.displayRandomQuote();
  });
}());
