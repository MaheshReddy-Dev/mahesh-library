class LibrariesController < ApplicationController
  before_action :set_library, only: %i[show edit update destroy]

  def show
  end

  def index
    @libraries = Library.all
  end

  def edit
    if params[:library] && params[:library][:region_ids]
      @region = Array.new
      params[:library][:region_ids].each do |r|
        r = r.to_i
        @region << Region.find(r)
      end
    end
  end

 def new
    @library = Library.new(library_params)
    if params[:library] && params[:library][:region_ids]
     @region = Array.new
     params[:library][:region_ids].each do |r|
       r = r.to_i
       @region << Region.find(r)
     end
    end
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      flash[:notice] = "Library added successfully."
      redirect_to @library
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(library_params)
      flash[:notice] = "Library was successfully updated."
      redirect_to @library
    else
      @region = Array.new
      params[:library][:region_ids].each do |r|
       r = r.to_i
        @region << Region.find(r)
      end
      render 'edit' , status: :unprocessable_entity
    end
  end
  def destroy
    @library.destroy
    flash[:notice] =  "library deleted successfully."
    redirect_to libraries_path
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.fetch(:library, {}).permit(:name,:company_id, location_ids: [], region_ids: [])
  end
end
