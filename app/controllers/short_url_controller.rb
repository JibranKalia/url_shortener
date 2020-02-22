class ShortUrlController < ApplicationController
  def show
    id = params[:id]
    @short_url = ShortUrl.find(slug: id)
    if @short_url.present?
      redirect_to @short_url.destination # Need to get the exact URL
    else
      # TODO: redirect to error page
    end


  end
end
