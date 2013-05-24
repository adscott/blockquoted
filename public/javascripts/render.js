n('blockquoted.render', function (ns) {

  function getContainer() {
    return $('#main');
  }

  ns.hideQuote = function () {
    return getContainer().fadeOut();
  };

  ns.renderQuote = function(template, quote) {
    var container = getContainer();
    var compiledTemplate = haml.compileHaml({source: template});
    container.html(compiledTemplate({quote: quote}));
    return container.fadeIn();
  };

});
