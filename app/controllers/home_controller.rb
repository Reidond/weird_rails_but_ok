class HomeController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @memes = Meme.all
  end

  def show
    @meme = Meme.find(params[:id])
  end
end
