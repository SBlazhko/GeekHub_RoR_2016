require_relative "like"
require_relative "post"
class User < Post
  attr_accessor :user_name, :post_title, :post_description
  def initialize(options)
    @user_name = options[:user_name]
    @post_title = options[:post_title]
    @post_description = options[:post_description]
  end
end
first_user = {user_name: "Jekie", message: ["Jekie post"]}
second_user = {user_name: "Chan", message: ["Chan post"]}
user1 = User.new(first_user)
user2 = User.new(second_user)
user1.set_posts
user2.set_posts