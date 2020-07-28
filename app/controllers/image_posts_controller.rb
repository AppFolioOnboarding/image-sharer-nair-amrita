class ImagePostController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])

    render :show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
