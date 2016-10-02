class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :new, :create, :destroy]

  def new
    @comment = Comment.new
    puts "=========="
    puts params
    puts "=========="
  end

  def create
    puts "========="
    puts params
    puts "========="
    puts "========="
    @comment = Comment.new(comment_params)
    puts @review
    if @comment.save
     redirect_to post_path(@post.id)
    else
      render :action => :new
    end
  end

  def destroy
    puts "==========="
    puts params
    puts "==========="
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to post_path(@post.id)
  end

  private
    def set_post
      puts "====="
      puts params
      puts "====="
      @product = Post.find(params[:post_id])        
    end

    def comment_params                                              
      params.require(:comment).permit(:author, :content, :post_id)        
    end
end