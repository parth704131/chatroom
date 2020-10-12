class HomeController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
    @users = User.all
  end
end