class MissionUsersController < ApplicationController
  def new
    @mission_user = MissionUser.new
    authorize @mission_user
    @mission = Mission.find(params[:mission_id])
  end
end
