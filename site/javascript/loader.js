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

    $('#main').fadeOut(400, function () {
      $.get(slug, function (data) {
        var template = haml.compileHaml('quote-template');
        $('#main').html(template({quote: data}));
        var expectedPath = '/' + data.hash_string;
        if (expectedPath !== getCurrentPath()) {
          window.history.pushState('0', 'blockquoted.com', expectedPath);
        }
        $('#main').fadeIn();
      });
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
    renderQuote(randomQuotePath);
  });
}());
