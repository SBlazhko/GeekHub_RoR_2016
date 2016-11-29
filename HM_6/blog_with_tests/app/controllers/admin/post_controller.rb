class Admin::PostsController < AdminController
  
  def index 
    @posts = Post.all
  end 
end