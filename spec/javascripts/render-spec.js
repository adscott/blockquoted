describe('blockquoted.render', function () {

  describe('examples', function () {

    var context = {};

    beforeEach(function () {
      $.ajax({url: '/public/javascripts/templates/quote.jshaml', async: false, success: function (data) {
        context.template = data;
      }});
      context.quote = {
        copy: 'some copy',
        hash_string: 'qwertyui'
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

    describe('tweet link', function () {
      beforeEach(function () {
        blockquoted.render.renderQuote(context.template, context.quote);
      });

      it('should have a tweet link', function () {
        expect($('a#tweet')).toHaveAttr('href', 'http://twitter.com/intent/tweet?url=http%3A%2F%2Fblockquoted.com%2Fqwertyui&text=some%20copy');
      });

      it('should be a popup link', function () {
        expect($('a#tweet')).toHaveClass('popup');
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
