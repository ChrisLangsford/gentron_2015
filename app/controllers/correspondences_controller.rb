class CorrespondencesController < ApplicationController
  before_action :set_correspondence, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @correspondences = Correspondence.all
    respond_with(@correspondences)
  end

  def show
    respond_with(@correspondence)
  end

  def new
    @correspondence = Correspondence.new
    respond_with(@correspondence)
  end

  def edit
  end

  def create
    @correspondence = Correspondence.new(correspondence_params)
    @correspondence.save
    respond_with(@correspondence)
  end

  def update
    @correspondence.update(correspondence_params)
    respond_with(@correspondence)
  end

  def destroy
    @correspondence.destroy
    respond_with(@correspondence)
  end

  private
    def set_correspondence
      @correspondence = Correspondence.find(params[:id])
    end

    def correspondence_params
      params.require(:correspondence).permit(:first_name, :last_name, :comapny, :designation, :contact_number, :email, :industry, :location, :additional_info)
    end
end
