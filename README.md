blockquoted
===========================

Source for http://blockquoted.com - a repository of software development one liner quotes of guidance.

## Setup

Install the bundle

$`bundle install`


Start sass:

$`bundle exec sass --watch public/stylesheets/sass/screen.scss:public/stylesheets/css/screen.css`


Start haml-server(sinatra):

$`bundle exec shotgun`


## Contribute

Add quotes to `quotes.yml` and make a pull request.

Add tests for any new functionality. Tests can be run using:

$`bundle exec rake`

## Credits

Thanks for @matthewcopeland for making this something people might want to look at.
