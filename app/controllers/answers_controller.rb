class AnswersController < ApplicationController
  #before_action :authenticate_seller! 今はややこしくなるから省く

  def create
    @answer = Answer.new(answer_params)
    @answer.seller_id = current_seller.id
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = "成功！"
      redirect_to("/questions/#{params[:question_id]}")
    else
      @question = Question.find(params[:question_id])
      flash.now[:alert] = "失敗！"
      render "questions/show"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end  
end
