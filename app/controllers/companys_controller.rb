class CompanysController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, { only: [:crate, :edit, :update, :destroy] }

  def index
    @q = Company.ransack(params[:q])
    @companys = @q.result(distinct: true).order(id: "DESC").page(params[:page]).per(5)
  end

  def show
    @company = Company.find(params[:id])
    @comments = @company.comments
    @comment = Comment.new
    @likes_count = Like.where(company_id: @company.id).count
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = "投稿を作成しました"
      redirect_to(companys_path)
    else
      flash[:notice] = "投稿を失敗"
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
    @company.total = params[:total]
    @company.dividend = params[:dividend]
    @company.information = params[:information]

    if @company.save

      flash[:notice] = "投稿を編集しました"
      redirect_to(company_path)
    else
      render("/companys/edit")
    end
  end

  def destroy
    @company = Company.find_by(id: params[:id])
    if @company.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to(companys_path)
    else
      flash[:notice] = "投稿を失敗"
      redirect_to(companys_path)
    end
  end

  def ranking
    @q = Company.ransack(params[:q])
    @companys = @q.result(distinct: true).order(id: "DESC").page(params[:page]).per(5)
  end

  def search
    selection = params[:keyword]
    @companys = Company.sort(selection)
  end

  def ensure_correct_user
    @company = Company.find_by(id: params[:id])
    if @company.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to(companys_path)
    end
  end

  private

  def company_params
    params.permit(:number, :name, :total, :dividend, :information).merge(user_id: current_user.id)
  end
end
