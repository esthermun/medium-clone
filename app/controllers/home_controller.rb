class HomeController < ApplicationController
  before_action :authenticate_user!, :only => :secret

  def index
  #need to show only last 10 posts
  	redirect_to posts_path
  end

  def secret
  end
end
