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
class ShortUrl < ApplicationRecord
  validates :destination, presence: true, format: { with: URI::regexp(%w(http https)), message: "is not a valid url" }, uniqueness: true
  validates :slug, presence: true

  def full_link
    # Localhost 3000 shouldn't be hardcoded
    URI.join('http://localhost:3000/', slug).to_s
  end
end
