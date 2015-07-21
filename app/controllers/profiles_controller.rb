class ProfilesController < ApplicationController
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
  	logger.debug(params)
  	@profile.user_id = current_user.user_id
  	@profile.save
  	#redirect_to (myprofilepage)

  end

  def show
  	@profile = Profile.find(params[:id])
  end
  def show_all
  	@profiles = Profile.all
  end

  private
  def profile_params
  	@profile.require(:profile).permit(:username, :name, :avatar)
  end
end
