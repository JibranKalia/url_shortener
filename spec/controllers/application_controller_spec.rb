require 'rails_helper'

RSpec.describe ShortUrlController, type: :controller do
  describe "#show" do
    it "redirects to the destination if short url is present" do
      destination = "http://www.google.com"
      short_url = ShortUrl.create!(slug: "1234", destination: destination) 
      get :show, params: { id: '1234' }
      assert_redirected_to destination
    end

    it 'shows 404 page if short url is not present' do
      get :show, params: { id: 'abcd' }
      assert_response :missing
      assert_template 'error_pages/404'
    end
  end
end