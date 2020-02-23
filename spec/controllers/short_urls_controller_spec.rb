require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  describe "#new" do
    it "should get new" do
      get :new
      assert_response :success
    end
  end

  describe "#create" do
    it "should create new short link" do
      @short_url = { destination: "http://www.google.com" }
      expect { 
        post :create, params: { short_url: @short_url }
      }.to change { ShortUrl.count }.by(1)

      assert_response :success
    end
  end

  describe "#redirect" do
    it "redirects to the destination if short url is present" do
      destination = "http://www.google.com"
      short_url = ShortUrl.create!(slug: "1234", destination: destination) 
      get :redirect, params: { id: '1234' }
      assert_redirected_to destination
    end

    it 'shows 404 page if short url is not present' do
      get :redirect, params: { id: 'abcd' }
      assert_response :missing
      assert_template 'error_pages/404'
    end
  end
end