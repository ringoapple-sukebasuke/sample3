class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(user_id: current_user.id, company_id: params[:company_id])
    @like.save
    redirect_to("/companys/#{params[:company_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, company_id: params[:company_id])
    @like.destroy
    redirect_to("/companys/#{params[:company_id]}")
  end
end