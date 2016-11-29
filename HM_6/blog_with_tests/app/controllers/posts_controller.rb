class PostsController < ApplicationController

  before_action :require_user, only: [:show]
  before_action :find_post, except: [:create, :index, :my_posts, :new]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_index_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def index
    @posts = Post.all
  end

  def my_posts
    @my_posts = current_user.posts
  end

  def show
    @user = User.find(@post.user_id) 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(current_user.id)
    else
      render :edit
    end
  end

  def destory
    @post.destroy
    redirect_to posts_index_path 
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end 

  def find_post
    @post = Post.find(params[:id])
  end

end
