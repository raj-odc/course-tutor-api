class Api::V1::CoursesController < ApplicationController
  def index
    courses = Course.all
    if courses.present?
      render json: courses.as_json(except: [:created_at, :updated_at]), status: :ok
    else
      render json: {error: 'Courses are not found'}, status: :not_found
    end
  end

  def create
    @course = Course.create(course_params)
    if @course.valid?
      render json: @course.as_json(except: [:created_at, :updated_at]), status: :created
    end
  end

  private
    def course_params
      params.require(:course).permit(:name, :description)
    end
end
