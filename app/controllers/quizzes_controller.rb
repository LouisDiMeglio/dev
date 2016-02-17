class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quiz
  def quiz
    @quiz = Quiz.where( posted_on: Time.now.strftime("%Y-%m-%d") )
    @quiz.each do |quiz|
      if quiz.published 
        redirect_to new_quiz_response_path(quiz)
        return
      end
    end
    redirect_to current_user, notice: 'No quiz posted for today.'
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @user = User.find_by(params[:session])
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)


    respond_to do |format|
      if @quiz.save
        Answer.create(question: @question, choice: params[:choice1], is_correct: false)
        Answer.create(question: @question, choice: params[:choice2], is_correct: false)
        Answer.create(question: @question, choice: params[:choice3], is_correct: false)
        Answer.create(question: @question, choice: params[:choice4], is_correct: false)
        Answer.where(question: @question)[params[:is_correct].to_i].update(is_correct: true)

        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:title, :published, :posted_on, :course_id, :user_id)
    end
end
