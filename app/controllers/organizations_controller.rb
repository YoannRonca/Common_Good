class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
    @mission = params[:mission_id]
  end

  def new
    @organization = Organization.new
    @mission = params[:mission_id]
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
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
    params.require(:organization).permit(:name, :description, :photo)
  end
end
