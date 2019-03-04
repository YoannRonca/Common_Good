class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @missions = Mission.all
    @missions_urgent = Mission.where(home_category: "urgent")
    @missions_trustyworth = Mission.where(home_category: "trustyworth")
    @missions_recent = Mission.where(home_category: "recent")
  end

  def show
    @organization = @mission.organization

    @missions = Mission.where.not(latitude: nil, longitude: nil)

    @markers = @missions.map do |mission|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @mission = Mission.new
    @photo = @mission.photos.build
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @mission = Mission.new(mission_params)
    @mission.organization = @organization

    if @mission.save
      if params[:photos]
        params[:photos].each do |photo|
          @mission.photos.create(photo: photo)
        end
      end
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @mission.update(mission_params)
    redirect_to mission_path(@mission)
  end

  def destroy
    @mission.destroy
    redirect_to missions_path
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
    params.require(:mission).permit(:city, :country, :continent, :climate, :great_for, :safety, :tolerance, :skill, :language, :start_date, :end_date, :title, :description, :cost_of_life, { photos_attributes: [:photo, :mission_id] }, :home_category)
  end

  def set_organization
    @mission = Mission.find(params[:id])
  end
end
