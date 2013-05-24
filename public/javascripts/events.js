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

  $(document).on('click', '.popup', function (e) {
    e.preventDefault();
    var destination = $(e.target).attr('href');
    window.open(destination, 'twitterwindow', 'height=450, width=550');
  });
}());
