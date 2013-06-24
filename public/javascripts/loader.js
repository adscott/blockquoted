n('blockquoted.loader', function (ns) {
  'use strict';
  var randomQuotePath = '/random';

  function getCurrentPath() {
    return window.location.pathname;
  }

  function getSlug() {
    return getCurrentPath() === '/' ? randomQuotePath : '/quote' + getCurrentPath();
  }

  function updateCurrentPath(path) {
    if (getCurrentPath() !== path) {
      window.history.pushState('0', 'blockquoted.com', path);
    }
  }

  ns.displayRandomQuote = function() {
    ns.displayQuote(randomQuotePath);
  };

  ns.displayQuote = function(slug) {
    slug = slug || getSlug();

    return $.when(
      blockquoted.render.hideQuote(),
      $.get(blockquoted.configuration.templatePath),
      $.get(slug)
    ).done(function (fadeRespone, templateResponse, quoteResponse) {
        blockquoted.render.renderQuote(templateResponse[0], quoteResponse[0]);
        updateCurrentPath('/' + quoteResponse[0].hash_string);
    });
  };
});
