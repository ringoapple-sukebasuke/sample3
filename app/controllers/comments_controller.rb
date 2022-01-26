class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    company = Company.find(params[:company_id])
    @comment = company.comments.build(comment_params)
    @comment.company_id = company.id
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to company_path(params[:company_id])
    else
      flash[:notice] = "コメント失敗"
      redirect_to company_path(params[:company_id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
