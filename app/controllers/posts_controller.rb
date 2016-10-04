class PostsController < ApplicationController
  #setting the user before each of these routes to eliminate redundancy in my code
  before_action :set_user, only: [:new, :create, :show, :destroy]   
  #same as above, but only need it for show page and delete route                
  before_action :set_post, only: [:show, :destroy]                                  

  def show
    #i 'puts' a LOT of things. always be testing and making sure you know where your data changes.
    # puts "=========="
    # puts @post.id
    # puts "=========="
    @comments = Comment.where("post_id": @post.id)
    # puts "==========="
    # puts @comments
    # puts @comments.class
    # puts "============"
  end

  def new
    # puts "====="
    # p params
    # puts "======"
    #create a new instance of the Post class, which the user will populate in the form.
    @post = Post.new          
  end

  def create 
    # puts "========"
    # puts post_params
    # puts "========"
    #making a new instance of the Post class, using the post-params from the form (there's a method for that in the private methods)
    @post = Post.new(post_params)         
     if @post.save
      #push the post into the user which is set
      @user.posts << @post                
      redirect_to @user
    else
      #so if there's an issue with the form and it can't submit, this error message will post. 
      flash[:error] = "something went wrong :("                                   
      render :action => :new
    end
  end

  def destroy
    # puts "========="
    # puts "i'm here!"
    # print @post
    # puts "========="
    #set the post in the set_post method and then get rid of it!! d e s t r o y.
    @post.destroy                           
    redirect_to @user
  end

  private 
  def set_user
    #use the params to find the user
    @user = User.find(params[:user_id])
  end

  def set_post
    #same as above, but this time with post
    @post = Post.find(params[:id])          
  end

  def post_params 
    #get the params out of the form (permit only the image and caption, so other info can't be passed into the form) 
    params.require(:post).permit(:title, :content) 
  end  
end