# Setup

## Docker Setup

Ensure you have docker on your system.

```
docker-compose up --build

# In a separate terminal window. Needs to be run only the first time.
docker-compose run web rails db:create 
docker-compose run web rails db:migrate

# Navigate to localhost:3000  

# Run tests
docker-compose run web rspec

# Shutdown
docker-compose down
```

## Non-Docker Setup

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

## Usage

### Creating a short link
Navigate to `http://localhost:3000/`.
You will see the following screen. Please put the complete URL including `http` or `https`

![Screen Shot 2020-02-24 at 10 22 01 AM](https://user-images.githubusercontent.com/14208431/75170371-a09c6d00-56ef-11ea-8158-bdae03fe3e78.png)

After successful shortening you will see the following success screen:
![Screen Shot 2020-02-24 at 10 24 32 AM](https://user-images.githubusercontent.com/14208431/75170931-7c8d5b80-56f0-11ea-984b-36a75679c3ea.png)

### Using the shortened link

Just copy the shortened url. For example `http://localhost:3000/HugF0sC-xY4UaAo0Yh5Ysg` and paste it to the URL. You will be automatically routed to the original url.

Please note that if the shortened url is mistyped or incorrect a 404 screen will be displayed.

## Future Improvement possibilities
- Better shortening algorithm. Currrently I am using `SecureRandom.urlsafe_base64`.
- Less stringent validations. I opted to go with uniqueness constraints on destination. This is not strictly necessary.
- Better url formatting logic. Currently, I require http to be entered with the url. This can definitely be improved.
- `rails new` adds a lot of unnecessary files including webpacker. I wish I had been more careful of the options I used.
- Not using Ruby 2.7 which leads to tons of unnecessary deprecation warnings.
- Automatic short link expiry.
- Visit tracking etc.

## Note 

Please ignore the numerous deprecation warnings such as `warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call`.

The underlying libraries like active record have not updated to for Ruby 2.7's changes.
