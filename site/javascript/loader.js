(function () {
  function getSlug() {
    return slug;
  }

  $(document).ready(function () {
    $.get(getSlug(), function (data) {
      var template = haml.compileHaml('quote-template');
      $('#main').html(template({quote: data}));
    });
  });
}());
