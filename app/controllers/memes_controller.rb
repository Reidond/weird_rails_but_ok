class MemesController < ApplicationController
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def show
      @meme = Meme.find(params[:id])
      @comments = @meme.comments.all
      @comment = @meme.comments.build
    end

    def new
      @meme = Meme.new
    end

    def create
      @meme = current_user.memes.create(meme_params)

      if @meme.meme_type == "easy_meme" && @meme.body.length > 0
        flash[:alert] = "You can add only images to easy_meme type"
        redirect_to new_meme_path
      end

      if @meme.meme_type == "long_meme" && @meme.picture.attached?
        flash[:alert] = "You can't add images to long_meme type"
        redirect_to new_meme_path
      end

      if @meme.meme_type == "short_meme" && @meme.body.length > 120
        flash[:alert] = "You can't add more than 120 symbols to short_meme type"
        redirect_to new_meme_path
      end

      if @meme.save
        flash[:notice] = "Meme successfully created"
        redirect_to root_path
      else
        flash[:alert] = "Something bad happened"
        redirect_to new_meme_path
      end
    end

    def edit
      @meme = Meme.find(params[:id])
    end

    def update
      @meme = Meme.find(params[:id])
      if @meme.meme_type == "easy_meme" && @meme.body.length > 0
        flash[:alert] = "You can add only images to easy_meme type"
        redirect_to new_meme_path
      end

      if @meme.meme_type == "long_meme" && @meme.picture.attached?
        flash[:alert] = "You can't add images to long_meme type"
        redirect_to new_meme_path
      end

      if @meme.save
        flash[:notice] = "Meme successfully created"
        redirect_to root_path
      else
        flash[:alert] = "Something bad happened"
        redirect_to new_meme_path
      end
    end

    def destroy
      @meme = Meme.find(params[:id])
      if @meme.destroy
        flash[:notice] = "Meme successfully destroyed"
        redirect_to root_path
      else
        flash[:alert] = "Something bad happend in destroying meme"
        redirect_to root_path
      end
    end

    private
    def meme_params
      params.require(:meme).permit(:title, :body, :meme_type, :picture)
    end
end
