class MemesController < ApplicationController
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def show
        @meme = Meme.find(params[:id])
    end

    def new
        @meme = Meme.new
    end
    def create
        @meme = current_user.memes.create(meme_params)
        pp @meme

        if @meme.save
            redirect_to root_path
        end
    end

    private
    def meme_params
        params.require(:meme).permit(:title, :body)
    end
end
