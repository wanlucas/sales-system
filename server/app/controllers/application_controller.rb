class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authenticate_request

  attr_reader :current_seller

  private

  def authenticate_request
    token = cookies.signed[:token]
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    decoded = JsonWebToken.decode(token)
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless decoded

    @current_seller = Seller.find_by(id: decoded[:seller_id])
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_seller
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def authenticate_optional
    token = cookies.signed[:token]
    return unless token

    decoded = JsonWebToken.decode(token)
    @current_seller = Seller.find_by(id: decoded[:seller_id]) if decoded
  end
end
