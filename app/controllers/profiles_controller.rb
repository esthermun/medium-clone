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
  	@profile = Profile.find(params[:id])
  end

  # def edit
  # end

  # def update
  # 	@profile = Profile.find(params[:id])
  # 	if @profile.update(profile_params)
  # 		redirect_to '@profile'
  # 	else
  # 		render "edit"
  # 	end
  # end

  def index
  	@profiles = Profile.all
  end

  private
  def profile_params
  	params.require(:profile).permit(:username, :name, :avatar)
  end
end
