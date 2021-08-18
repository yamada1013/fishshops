class AnswersController < ApplicationController
  #before_action :authenticate_seller! 今はややこしくなるから省く

  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @fish = Fish.find(params[:fish_id])
  end

  def new
    @fish = Fish.find(params[:fish_id])
    #@fish = Fish.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @fish = Fish.find(params[:fish_id])
    @question = Question.find(params[:question_id])

    @answer = Answer.new(answer_params)
    @answer.seller_id = current_seller.id

    @answer.question_id = params[:question_id]
    @answer.fish_id = params[:fish_id]

    #if
      @answer.save
      flash[:notice] = "成功！"
      #redirect_to("/questions/#{params[:question_id]}")
      redirect_to fish_question_path(@fish,@question)
      #redirect_to fish_question_answer_path(@fish,@question,@answer)
    #else
      #@question = Question.find(params[:question_id])
      #flash.now[:alert] = "失敗！"
      #render "questions/show"
    #end
  end

  def edit
    @question = Question.find(params[:question_id])
    @fish = Fish.find(params[:fish_id])
    @answer = Answer.find(params[:id])


  #@question = Question.find(params[:id])
  #@question = Question.find(params[:question_id])
  #@answer = Answer.find(params[:id])
  #@answer = Answer.find_by(id: params[:question_id])

  end

  def update
    #@question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @fish = Fish.find(params[:fish_id])

    #@answer.seller_id = current_seller.id
    #@answer.question_id = params[:question_id]
     @answer.update(answer_params)
      flash[:notice] = "成功！"
      redirect_to fish_question_path(@fish,@question)
      #redirect_to fish_question_answer_path(@fish,@question,@answer)

  end

  def destroy
   @answer = Answer.find(params[:id])
   @question = Question.find(params[:question_id])
   @fish = Fish.find(params[:fish_id])

   @answer.destroy
   flash[:notice] = "成功！"
   redirect_to fish_question_path(@fish,@question)
   #redirect_to("/fishs/#{params[:fish_id]}")
   #redirect_to fish_question_answer_path(@fish,@question,@answer)
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
