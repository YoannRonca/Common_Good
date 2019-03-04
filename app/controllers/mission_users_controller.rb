class MissionUsersController < ApplicationController
  def index
    @mission_users = current_user.mission_users
    # filtrer pour status
    @mission_users_pending = MissionUser.where(status: "pending")
    @mission_users_accepted = MissionUser.where(status: "accepted")
    @mission_users_declined = MissionUser.where(status: "declined")
  end

  # def new
  #   @mission_user = MissionUser.new
  #   @mission = Mission.find(params[:mission_id])
  # end

  def create
    @mission = Mission.find(params[:mission_id])
    @mission_user = MissionUser.new mission: @mission, user: current_user
    @mission_user.status = "pending"
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
