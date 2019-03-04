class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
    @mission = params[:mission_id]
  end

  def new
    @organization = Organization.new
    @photo = @organization.photos.build
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      if params[:photos]
        params[:photos].each do |photo|
          @organization.photos.create(photo: photo)
        end
      end
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    organization = Organization.find(params[:id])
    organization.update(organization_params)
    redirect_to organization_path(organization)
  end

  def destroy
    organization = Organization.find(params[:id])
    organization.destroy
    redirect_to organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name, :description, photos_attributes: [:photo, :organization_id]
    )
  end
end
