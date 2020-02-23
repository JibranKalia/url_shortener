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
require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe "create" do 
    it "is successful when slug and destination is present" do
      expect { 
        ShortUrl.create!(slug: "1234", destination: "http://www.google.com") 
      }.to change { ShortUrl.count }.by(1)
    end

    it "fails when destination is missing" do 
      expect { 
        ShortUrl.create!(slug: "1234")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "fails when slug is missing" do 
      expect { 
        ShortUrl.create!(destination: "http://www.google.com")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'fails if destination is not a valid RFC2396 url' do
      expect { 
        ShortUrl.create!(slug: "1234", destination: "google.com") 
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
