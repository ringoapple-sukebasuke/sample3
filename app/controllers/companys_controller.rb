class CompanysController < ApplicationController
  def index
    @companys = Company.all.order(created_at: :desc)
  end

  def show
    @company = Company.find_by(id: params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(
      number: params[:number],
      name: params[:name],
      information: params[:information]
    )
    if @company.save
      flash[:notice] = "投稿を作成しました"
      redirect_to(companys_path)
    else
      render(new_company_path)
    end
  end

  def edit
    @company = Company.find_by(id: params[:id])
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.number = params[:number]
    @company.name = params[:name]
    @company.information = params[:information]
    if @company.save
      flash[:notice] = "投稿を編集しました"
      redirect_to(companys_path)
    else
      render("/companys/edit")
    end
  
  end

  def destroy
    @company = Company.find_by(id: params[:id])
    @company.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to(companys_path)
  
  end
end
