(function () {
  var randomQuotePath = '/random';

  function getCurrentPath() {
    return window.location.pathname;
  }

  function getSlug() {
    return getCurrentPath() === '/' ? randomQuotePath : '/quote' + getCurrentPath();
  }

  function renderQuote(slug) {
    slug = slug || getSlug();
    $.get(slug, function (data) {
      var template = haml.compileHaml('quote-template');
      $('#main').html(template({quote: data}));
      var expectedPath = '/' + data.hash_string;
      if (expectedPath !== getCurrentPath()) {
        window.history.pushState('0', 'blockquoted.com', expectedPath);
      }
    });
  }

  $(window).bind("popstate", function() {
    renderQuote();
  });

  $(document).ready(function () {
    renderQuote();
  });

  $('#another').click(function (e) {
    e.preventDefault();

    // adam! fix me coz i sucks as t3h jerverschkerps
    // var oldquote = ( $('#quote').text() );
    // $('body').prepend('<div class="fallout">' + oldquote + '</div>');

    renderQuote(randomQuotePath);
  });
}());
