class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @missions = Mission.all
  end

  def show
    @organization = @mission.organization
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @mission = Mission.new
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @mission = Mission.new(mission_params)
    @mission.organization = @organization
    if @mission.save!
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def edit
  end

  def update
    mission.update(mission_params)
    redirect_to mission_path(animation)
  end

  def destroy
    mission.destroy
    redirect_to mission_path
  end

  def search
    if params[:query].present?
      @missions = Mission.perform_search(params[:query])
    else
      @missions = Mission.all
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:city, :country, :continent, :climate, :great_for, :safety, :tolerance, :skill, :language, :start_date, :end_date, :title, :description, :cost_of_life)
  end

  def set_organization
    @mission = Mission.find(params[:id])
  end
end
