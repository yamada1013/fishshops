class QuestionsController < ApplicationController
  #before_action :authenticate_buyer!, only: [:new, :create, :edit, :update, :destroy] 今は省く

  def index
 @questions = Question.all
end

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

  def update
     @question = Question.find(params[:id])
     if @question.update(question_params)
       flash[:notice] = "成功！"
       redirect_to("/questions/#{@question.id}")
     else
       flash.now[:alert] = "失敗！"
       render("questions/edit")
     end
   end

   def show
     @question = Question.find(params[:id])
     @answer = Answer.new
   end

   def edit
     @question = Question.find(params[:id])
   end

   def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "成功！"
    redirect_to("/questions")
  end


  private
    def question_params
      params.require(:question).permit(:body,:title)
    end

  end
