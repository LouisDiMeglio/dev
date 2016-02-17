class UserCoursesController < ApplicationController
  def new
  end

  def create
    @usercourse = UserCourse.new(usercourse_params)
    @courselist = Course.find(5).users.pluck(:email)
    respond_to do |format|
      if @usercourse.save
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @usercourse.errors, status: :unprocessable_entity }
      end 
    end
  end

  private
    def usercourse_params
      params.require(:user_course).permit(:user_id, :course_id)
    end
end
