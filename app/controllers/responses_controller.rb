class ResponsesController < ApplicationController
  
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @questions = Quiz.find(params[:quiz_id]).questions
    @response = Response.find(params[:id])
    @user = User.find_by(params[:session])
  end

  def new
    @user = User.find_by(params[:session])
    @quiz = Quiz.find(params[:quiz_id])
    @course = Quiz.find(params[:quiz_id]).course
    @response = Response.new
    
    @quiz.questions.each do |question|
      @response.answers.new(question: question)
    end

  end

  def create
    @user = User.find_by(params[:session])
    @quiz = Quiz.find(params[:quiz_id])
    @course = Quiz.find(params[:quiz_id]).course
    @questions = Quiz.find(params[:quiz_id]).questions
    @response = Response.new(response_params)
    @response.user = current_user
    @response.quiz = @quiz
    @response.save
    redirect_to "/"

  end

  def edit
    @response = Response.find(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:quiz_id, :answers_attributes  => [:question_id, :choice])
    end
end
