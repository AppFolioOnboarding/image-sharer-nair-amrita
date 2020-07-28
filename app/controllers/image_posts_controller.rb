class ImagePostsController < ApplicationController
  def new
    @post = ImagePost.new
    render :new
  end

  def index
    @posts = ImagePost.all
    render :index
  end

  def show
    @post = ImagePost.find(params[:id])

    render :show
  end

  def create
    @post = ImagePost.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:image_post).permit(:title, :image)
  end
end
