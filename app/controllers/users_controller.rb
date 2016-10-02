class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_user, only: [:show]
  def show
    puts "========"
    p @user
    p @user.posts
    puts "========"
    @posts = @user.posts                          #find the user and show all their posts. it's kinda like a homepage for a logged in user.
  end

  private 
  def set_user
    @user = User.find(params[:id])   
  end
end