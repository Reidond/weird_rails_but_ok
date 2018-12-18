class MemesController < ApplicationController
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def show
        @meme = Article.find(params[:id])

    def new; end
    def create
        @meme = Meme.new(meme_params)

        @meme.save
        redirect_to @meme
    end

    private
    def meme_params
        params.require(:article).permit(:title, :body)
    end
end
