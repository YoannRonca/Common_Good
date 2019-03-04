class MissionUsersController < ApplicationController
  def index
    @mission_users = current_user.mission_users
    # filtrer pour status
    # @missions_urgent = Mission.where(home_category: "urgent")
    # @missions_trustyworth = Mission.where(home_category: "trustyworth")
    # @missions_recent = Mission.where(home_category: "recent")
  end

  # def new
  #   @mission_user = MissionUser.new
  #   @mission = Mission.find(params[:mission_id])
  # end

  def create
    @mission = Mission.find(params[:mission_id])
    @mission_user = MissionUser.new mission: @mission, user: current_user

    if @mission_user.save
      respond_to do |format|
        format.html { redirect_to mission_path(@mission) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'missions/show' }
        format.js  # <-- idem
      end
    end
  end
end
