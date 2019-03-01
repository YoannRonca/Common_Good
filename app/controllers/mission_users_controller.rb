class MissionUsersController < ApplicationController
  def new
    @mission_user = MissionUser.new
    @mission = Mission.find(params[:mission_id])
  end

  def create

  end
end
