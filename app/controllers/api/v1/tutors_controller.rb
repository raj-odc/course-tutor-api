# frozen_string_literal: true

module Api
  module V1
    class TutorsController < ApplicationController
      before_action :set_course, only: %i[create show]
      before_action :set_tutor, only: :show

      def index
        tutors = Tutor.where(course_id: params[:course_id])
        if tutors.present?
          render json: tutors, status: :ok
        else
          render json: { error: 'Tutors are not found' }, status: :not_found
        end
      end

      def create
        tutor = @course.tutors.build(tutors_params)
        render json: tutor, status: :created if tutor.save!
      end

      private

      def tutors_params
        params.require(:tutor).permit(:name, :email)
      end

      def set_course
        @course = Course.find(params[:course_id])
      end

      def set_tutor
        @tutor = Tutor.find_by!(course_id: @course.id)
      end
    end
  end
end
