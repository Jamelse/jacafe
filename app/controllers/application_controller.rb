class ApplicationController < ActionController::Base

  include ActionController::Cookies

  skip_before_action :verify_authenticity_token

  before_action :authorize_user
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  private 

  def authorize_user 
    @current_user = User.find_by(id: session[:user_id])
  end

  def render_not_found_response(exception)
    render json: { error: "#{exception.model} not found" }, status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
