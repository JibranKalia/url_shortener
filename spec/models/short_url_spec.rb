require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe "create" do 
    it "is successfull when slug and destination is present" do
      expect { 
        ShortUrl.create(slug: "1234", destination: "www.google.com") 
      }.to change { ShortUrl.count }.by(1)
    end

    it "fails when destination is missing" do 
      expect { 
        ShortUrl.create!(slug: "1234")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "fails when slug is missing" do 
      expect { 
        ShortUrl.create!(destination: "www.google.com")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "fails if destination is not a valid URL" do
      expect { 
        ShortUrl.create!(slug: "1234", destination: "1234")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
