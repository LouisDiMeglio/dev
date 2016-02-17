class QuestionsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to :back }
        format.json { head :no_content }
       else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:quiz_id, :content, :options, :option1, :option2, :option3, :option4, :answer)
    end


end
