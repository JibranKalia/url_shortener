# Setup

```
  # Clone Repo
  git clone https://github.com/JibranKalia/url_shortener.git
  cd url_shortener

  # Get Ruby 2.7 via RVM
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  rvm install ruby-2.7.0
  rvm use ruby-2.7.0

  # Get Yarn
  brew install yarn

  # Get and start postgres via Homebrew
  brew install postgresql
  brew services start postgresql

  # Create Database
  createdb 'url_shortener_development'
  createdb 'url_shortener_test'

  # Install gems
  bundle install && yarn install
  bundle exec rails db:migrate

  # Start server
  bundle exec rails s -p 3000

  # To run tests
  bundle exec rspec
```
