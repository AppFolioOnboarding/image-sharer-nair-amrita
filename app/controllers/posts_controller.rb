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

# requests are received by Rails
# e.g. GET /posts/new
#
# Rails tries to find a matching ROUTE
# routes are defined in config/routes.rb
# -> Which controller and method should we pass this request to?
#
# Routes are matched by path (aka URL) and HTTP method
# In this example we are looking for a route that matches
# GET /posts/new
#
# Defining routes:
# HTTP_VERB 'URL/PATH'
#
# get 'posts/new'
# GET /posts/new -> PostsController#new
#
# index 'posts'
# GET /posts -> PostsController#index
#
# resources(:posts)
# this defines the 7 common restful routes for "Post"

# Once we make it to a controller -- generate a response
#
# class PostsController
#  def show
#
#    render :show
#  end
# end
