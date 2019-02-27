class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
    @organization = @mission.organization
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @mission = Mission.new
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @mission.organization = @organization

    @mission = Mission.new(mission_params)
    if @mission.save!
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    mission.update(mission_params)
    redirect_to mission_path(animation)
  end

  def destroy
    mission = Mission.find(params[:id])
    mission.destroy
    redirect_to mission_path
  end

  private

  def mission_params
    params.require(:mission).permit(:city, :country, :continent, :climate, :great_for, :safety, :tolerance, :skill, :language, :start_date, :end_date, :title, :description, :cost_of_life)
  end
end
