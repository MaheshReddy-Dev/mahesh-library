class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
   @companies = Company.all
  end

  def show
  end

  def edit
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
     if @company.save
       redirect_to @company
       flash[:notice] =  "Company was successfully created."
     else
      render 'new' , status: :unprocessable_entity
     end
  end

  def update
    if @company.update(company_params)
      redirect_to @company
      flash[:notice] = "Company was successfully updated."
     else
     render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    flash[:notice] = "Company deleted successfully"
    redirect_to companies_path
  end

  private
     def set_company
       @company = Company.find(params[:id])
     end

     def company_params
       params.require(:company).permit(:name,:region_id,:location_id,:website,:location)
     end
end
