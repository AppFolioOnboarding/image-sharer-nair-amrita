class ImagePostsController < ApplicationController
  def new
    @post = ImagePost.new
    render :new
  end

  def index
    @posts = ImagePost.all
    @posts = ImagePost.tagged_with(params[:tag]).order(created_at: :desc) if params[:tag].present?
    render :index
  end

  def show
    @post = ImagePost.find(params[:id])
    @related_posts = @post.find_related_tags
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

  def tagged
    @posts = if params[:tag].present?
               ImagePost.tagged_with(params[:tag])
             else
               ImagePost.all
             end
  end

  private

  def post_params
    params.require(:image_post).permit(:title, :image, :tag_list)
  end
end
