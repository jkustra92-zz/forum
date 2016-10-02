class HomeController < ApplicationController
  def index               #need a home controller/index for devise and my root to go to.
    @posts = Post.all
    puts "==========="
    puts @posts
    puts "==========="

    @posts.each do |post|
      puts post.user
    end
  end

  #eventually, get all the posts out of the database and display them here using the homepage view.
end