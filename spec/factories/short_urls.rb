FactoryBot.define do
  factory :short_url do
    slug { "123456789" }
    destination { "www.google.com" }
  end
end
