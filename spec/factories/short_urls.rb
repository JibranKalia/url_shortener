# == Schema Information
#
# Table name: short_urls
#
#  id          :bigint           not null, primary key
#  destination :string           not null
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_short_urls_on_destination  (destination) UNIQUE
#  index_short_urls_on_slug         (slug) UNIQUE
#
FactoryBot.define do
  factory :short_url do
    sequence(:slug) { |n| n.to_s }
    sequence(:destination) { |n| "http://www.google.com/#{n}" }
  end
end
