module UserAuthentication
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user
  end

  private

  def authenticate_user
    token = cookies.signed[:token]
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    decoded = JsonWebToken.decode(token)
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless decoded
    return render json: { error: 'Invalid token type' }, status: :unauthorized unless decoded[:type] == 'user'

    @current_user = User.find_by(id: decoded[:user_id])
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def authenticate_user_optional
    token = cookies.signed[:token]
    return unless token

    decoded = JsonWebToken.decode(token)
    return unless decoded && decoded[:type] == 'user'
    
    @current_user = User.find_by(id: decoded[:user_id])
  end
end
