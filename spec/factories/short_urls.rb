FactoryBot.define do
  factory :short_url do
    sequence(:slug) { |n| n.to_s }
    sequence(:destination) { |n| "http://www.google.com/#{n}" }
  end
end
