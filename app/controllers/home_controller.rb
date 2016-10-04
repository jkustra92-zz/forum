class HomeController < ApplicationController
  #need a home controller/index for devise and my root to go to.
  def index 
    #get the current user so we can figure out if they are logged in and so they can post right from the homepage           
    @user = current_user
    #grab all the posts from the database
    @posts = Post.all
    # puts "==========="
    # puts @posts
    # puts "==========="
    @posts.each do |post|
      puts post.user
    end
  end
end