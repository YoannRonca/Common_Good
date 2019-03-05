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
        lng: mission.longitude,
        lat: mission.latitude
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

  def search
    if params[:query]
      @missions = Mission.perform_search(params[:query])
    elsif params[:filter]
      # {"utf8"=>"✓", "filter"=>{"CostOfLife"=>"<$500/month", "continent"=>"North America", "sectors"=>"Education"}, "commit"=>"Save Query"}
      filter_values = filter_params.values.compact.join("|")
      @missions = Mission.perform_search(filter_values)
      # TO DO: select missions with filters
    else
      @missions = Mission.all
    end
  end

  private

  def filter_params
    params[:filter].permit('cost_of_life', 'continent', 'sectors', 'great_for', 'climate', 'language', 'safety')
  end

  def mission_params
    params.require(:mission).permit(
      :cost_of_life, :city, :country, :continent, :climate, :great_for, :safety, :tolerance, :skill, :language, :start_date, :end_date, :title, :description, { photos_attributes: [:photo, :mission_id] }, :home_category
    )
  end

  def set_organization
    @mission = Mission.find(params[:id])
  end
end
