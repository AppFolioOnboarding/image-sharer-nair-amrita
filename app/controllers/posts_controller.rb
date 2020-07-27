class PostsController < ApplicationController
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
      # redirect_to post_path(@post)
      # redirect_to "/posts/#{@post.id}"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
