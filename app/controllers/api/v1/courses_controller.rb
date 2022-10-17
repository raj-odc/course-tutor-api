# frozen_string_literal: true

module Api
  module V1
    class CoursesController < ApplicationController
      def index
        courses = Course.all.includes(:tutors)
        if courses.present?
          render json: courses, status: :ok
        else
          render json: { error: 'Courses are not found' }, status: :not_found
        end
      end

      def create
        @course = Course.create(course_params)
        render json: @course.as_json(except: %i[created_at updated_at]), status: :created if @course.valid?
      end

      private

      def course_params
        params.require(:course).permit(:name, :description)
      end
    end
  end
end
