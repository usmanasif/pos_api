class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]
  before_action :authenticate_admin!
  # GET /companies
  def index
    @companies = Company.paginate(page:params[:page]).order(:id)
    render json: {companies: @companies, current_page:@companies.current_page, total_pages:@companies.total_pages}
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.permit(:subdomain, :name, :logo, :about_you)
    end
end
