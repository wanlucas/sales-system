module SellerAuthentication
  extend ActiveSupport::Concern

  included do
    attr_reader :current_seller
  end

  private

  def authenticate_seller
    token = cookies.signed[:token]
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    decoded = JsonWebToken.decode(token)
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless decoded
    return render json: { error: 'Invalid token type' }, status: :unauthorized unless decoded[:type] == 'seller'

    @current_seller = Seller.find_by(id: decoded[:seller_id])
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_seller
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def authenticate_seller_optional
    token = cookies.signed[:token]
    return unless token

    decoded = JsonWebToken.decode(token)
    return unless decoded && decoded[:type] == 'seller'
    
    @current_seller = Seller.find_by(id: decoded[:seller_id])
  end
end
