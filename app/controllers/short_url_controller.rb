class ShortUrlController < ApplicationController
  def show
    id = params[:id]
    @short_url = ShortUrl.find_by(slug: id)
    if @short_url.present?
      redirect_to @short_url.destination
    else
      render template: 'error_pages/404', layout: false, status: :not_found
    end
  end
end
