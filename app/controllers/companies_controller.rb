class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      # flash[:error] = "Your company was rejected!"
      render :new
    end

    # params includes the following hash: { "company" => { "name" => "Faizaan's School of Wizardry", "location" => "Boston"}}
    # We could try to bypass strong params by doing something like this, but Rails 4 won't let us:
    # @company = Company.new(name: params["company"]["name"], location: params["company"]["location"] )
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :website, :industry, :description)
  end

end
