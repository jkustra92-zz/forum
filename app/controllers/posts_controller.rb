class PostsController < ApplicationController
  # before_action :authenticate_user!, only: [:show, :destroy, :new, :create]         #before the route, authenticate the user so ppl who aren't logged in can't access routes
  before_action :set_user, only: [:new, :create, :show, :destroy]                   #setting the user before each of these routes to eliminate redundancy in my code
  before_action :set_post, only: [:show, :destroy]                                  #same as above, but only need it for show page and delete route

  def show
    puts "=========="
    puts @post.id
    puts "=========="
    @comments = Comment.where("post_id": @post.id)
    puts "==========="
    puts @comments
    puts @comments.class
    puts "============"
  end

  def new
    puts "====="
    p params
    puts "======"
    @post = Post.new          #make a new instance of the Post class, which the user will later fill out in the super intelligent form that knows things
  end

  def create 
    puts "========"
    puts post_params
    puts "========"
    @post = Post.new(post_params)         #making a new instance of the Post class, using the post-params from the form (there's a method for that in the private methods)
     if @post.save
      @user.posts << @post                #push the post into the user which is set
      redirect_to @user
    else
      flash[:error] = "something went wrong :("                                   #so if there's an issue with the form and it can't submit, this error message will post. 
      render :action => :new
    end
  end

  def destroy
    puts "========="
    puts "i'm here!"
    print @post
    puts "========="
    @post.destroy                           #set the post in the set_post method and then get rid of it!! d e s t r o y.
    redirect_to @user
  end

  private 
  def set_user
    #use the params to find the user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])           #same as above, but this time with post
  end

  def post_params  
    params.require(:post).permit(:title, :content)     #get the params out of the form (permit only the image and caption, so other info can't be passed into the form)
  end  
end