class Post

  def creat_post(post)
    @post = post
    @message.push @post
  end

  def edit_last_post(post)
    @message.pop
    @message.push post
  end

  def delete_last_post
    @message.pop
  end

  def delete_all_posts
    @message.clear
  end

  def show_posts
    puts "#{@user_name} posted"
    if_no_posts?
    @message.each {|post| p post}
  end 

  private

  def if_no_posts?
    if @message == []
      puts "User doesn't added any message"
    end 
  end

end 