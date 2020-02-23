class ShortUrlsController < ApplicationController
  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(params[:short_url].permit(:destination))
    @short_url.slug = SecureRandom.urlsafe_base64
    if @short_url.save!
      redirect_to @short_url
    else
      redirect_to new_short_url_path, notice: "Error creating link."
    end
  end

  def show
    @short_url = ShortUrl.find(params[:id])
  end

  def redirect 
    slug = params[:id]
    @short_url = ShortUrl.find_by(slug: slug)
    if @short_url.present?
      redirect_to @short_url.destination
    else
      render template: 'error_pages/404', layout: false, status: :not_found
    end
  end
end
