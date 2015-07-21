class ProfilesController < ApplicationController
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
  	logger.debug(params)
  	@profile.user_id = current_user.id
  	@profile.save
  	redirect_to '/'

  end

  def show
  	#@id = @profile.user_id
  	@profile = Profile.find(params[:user_id])
  end

  def update
  end

  # def show_all
  # 	@profiles = Profile.all
  # end

  private
  def profile_params
  	params.require(:profile).permit(:username, :name, :avatar)
  end
end
