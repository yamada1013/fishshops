class QuestionsController < ApplicationController
  #before_action :authenticate_buyer!, only: [:new, :create, :edit, :update, :destroy] 今は省く

  def index
 @questions = Question.all
end

  def new
    @fish = Fish.find(params[:fish_id])
    @question = Question.new
    #@fish = Fish.find(params[:id])
  end

  def create
    @fish = Fish.find(params[:fish_id])
    @question = Question.new(question_params)
    @question.buyer_id = current_buyer.id
    @question.fish_id = params[:fish_id]
     @question.save
      flash[:notice] = "成功！"
      #redirect_to("/fishs/5/questions/22")
      redirect_to fish_question_path(@fish,@question)
      #redirect_to("/fishs/#{params[:fish_id]}/questions/#{params[:id]}")
      #redirect_to("/fishs/#{params[:fish_id]}")
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
     @fish = Fish.find(params[:fish_id])
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
