class Like
@like = 0
  def creat_like
    @like +=  1 
  end
  def delete_like
    @like -= 1
  end
  def show_like
    puts "User liked  #{@like}" 
  end
end 
like = Like.new
like.creat_like
like.show_like