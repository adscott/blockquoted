describe('blockquoted.render', function () {

  describe('examples', function () {

    var context = {};

    beforeEach(function () {
      $.ajax({url: '/public/javascripts/templates/quote.jshaml', async: false, success: function (data) {
        context.template = data;
      }});
      context.quote = {
        copy: 'some copy'
      };
      jasmine.getFixtures().set('<section id="main" />');
    });

    describe('when there is just copy', function () {
      beforeEach(function () {
        blockquoted.render.renderQuote(context.template, context.quote);
      });

      sharedCopyExample(context);

      it('should not have any citation text', function () {
        expect($('#citation')).not.toExist();
      });
    });

    describe('when there is copy and citation text', function () {
      beforeEach(function () {
        context.quote.citation_text = 'some citation';
        blockquoted.render.renderQuote(context.template, context.quote);
      });

      sharedCopyExample(context);
      sharedCitationTextExample(context);

      it('should not have a citation link', function () {
        expect($('#citation a')).not.toExist();
      });
    });

    describe('when there is copy, citation text and a citation url', function () {
      beforeEach(function () {
        context.quote.citation_text = 'some citation';
        context.quote.citation_url = 'http://foo.bar/';
        blockquoted.render.renderQuote(context.template, context.quote);
      });


      sharedCopyExample(context);
      sharedCitationTextExample(context);

      it('should have a citation link', function () {
        expect($('#citation a')).toHaveAttr('href', context.quote.citation_url);
      });
    });
  });

  function sharedCopyExample(context) {
    it('should display copy', function () {
      expect($('#quote')).toHaveText(context.quote.copy);
    });
  }

  function sharedCitationTextExample(context) {
    it('should have plain citaion text', function () {
      expect($('#citation')).toHaveText(context.quote.citation_text);
    });
  }

});
