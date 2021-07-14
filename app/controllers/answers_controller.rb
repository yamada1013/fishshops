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

  def edit
  @answer = Answer.find(params[:id])
  #@question = Question.find(params[:id])
  @question = Question.find(params[:question_id])
  #@question = Question.find(params[:question_id])
  #@answer = Answer.find(params[:id])
  #@answer = Answer.find_by(id: params[:question_id])
  end

  def update
    #@question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])

    #@answer.seller_id = current_seller.id
    #@answer.question_id = params[:question_id]
    if @answer.update(answer_params)
      flash[:notice] = "成功！"
      redirect_to("/questions/#{@question.id}")
    else
      flash.now[:alert] = "失敗！"
      render("questions/edit")
    end
  end

  def destroy
   @answer = Answer.find(params[:id])
   @question = Question.find(params[:question_id])
   @answer.destroy
   flash[:notice] = "成功！"
   redirect_to("/questions/#{@question.id}")
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
