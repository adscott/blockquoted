n('blockquoted.render', function (ns) {
  'use strict';

  function getContainer() {
    return $('#main');
  }

  ns.hideQuote = function () {
    return getContainer().fadeOut();
  };

  ns.renderQuote = function(template, quote) {
    var tweet = 'http://twitter.com/intent/tweet' +
      '?url=' + encodeURIComponent('http://blockquoted.com/' + quote.hash_string) +
      '&text=' + encodeURIComponent(quote.copy),

      compiledTemplate = haml.compileHaml({source: template}),

      container = getContainer();

    container.html(compiledTemplate({quote: quote, tweet: tweet}));

    return container.fadeIn();
  };

});
