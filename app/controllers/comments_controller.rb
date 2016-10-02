class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :new, :create, :destroy]

  def new
    @user = User.find(params[:user_id])
    @comment = Comment.new
    puts "=========="
    puts params
    puts "=========="
  end

  def create
 
    puts "========="
    puts params[:comment][:user_id]
    puts "========="
    puts "========="
    @comment = Comment.new(comment_params)
    puts @comment
    if @comment.save
     @user = User.find(params[:comment][:user_id])
     redirect_to user_post_path(@user.id, @post.id)
    else
      render :action => :new
    end
  end

  def destroy
    puts "==========="
    puts params
    puts "==========="
    @comment = Comment.find(params[:id])
    @comment.destroy
    @user = User.find(params[:user_id])
    redirect_to user_post_path(@user.id, @post.id)
  end

  private
    def set_post
      puts "====="
      puts params
      puts "====="
      @post = Post.find(params[:post_id])        
    end

    def comment_params                                              
      params.require(:comment).permit(:author, :content, :post_id)        
    end
end