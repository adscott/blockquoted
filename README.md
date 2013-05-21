blockquoted
===========================

Source for http://blockquoted.com - a repository of software development one liner quotes of guidance.

## Setup

This uses a lightweight sinatra wrapper, haml-server. https://github.com/bernerdschaefer/haml-server


Install the bundle

$`bundle install`


Start sass:

$`bundle exec sass --watch site/stylesheets/sass/screen.scss:site/stylesheets/css/screen.css`


Start haml-server(sinatra):

$`bundle exec shotgun`


## Contribute

Add quotes to `quotes.yml` and make a pull request.

Add tests for any new functionality. Tests can be run using:

$`bundle exec rspec`

## Credits

Thanks for @matthewcopeland for making this something people might want to look at.
