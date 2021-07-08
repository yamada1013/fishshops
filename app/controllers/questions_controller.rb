class QuestionsController < ApplicationController
  #before_action :authenticate_buyer!, only: [:new, :create, :edit, :update, :destroy] 今は省く

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.buyer_id = current_buyer.id
    if @question.save
       flash[:notice] = "成功！"
       redirect_to("/questions/new")
    else
       flash.now[:alert] = "失敗！"
       render("questions/new")
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end



  private
    def question_params
      params.require(:question).permit(:body)
    end

  end
