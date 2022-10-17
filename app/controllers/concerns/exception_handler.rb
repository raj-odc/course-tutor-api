# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      render_error(e.message, :internal_server_error)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render_error(e.message, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render_error(e.message, :bad_request)
    end

    rescue_from ActiveRecord::InvalidForeignKey do |e|
      render_error(e.message, :bad_request)
    end

    rescue_from ActiveRecord::Validations do |e|
      render_error(e.message, :unprocessable_entity)
    end
  end
end
