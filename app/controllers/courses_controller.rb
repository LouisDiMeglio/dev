class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @quizzes = @course.quizzes.to_a
    @students = User.where(course_id: params[:id])
    @uc = Course.find(params[:id]).users
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @students = User.where(course_id: params[:id])

    respond_to do |format|
      if @course.save
        UserCourse.create(user_id: current_user.id, course_id: @course.id)
        format.html { redirect_to @course, notice: 'Course was successfully created. Now add students.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title)
    end
end
