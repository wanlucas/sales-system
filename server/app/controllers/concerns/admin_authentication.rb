module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    attr_reader :current_admin
  end

  private

  def authenticate_admin
    token = cookies.signed[:token]
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    decoded = JsonWebToken.decode(token)
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless decoded
    return render json: { error: 'Invalid token type' }, status: :unauthorized unless decoded[:type] == 'admin'

    @current_admin = Admin.find_by(id: decoded[:admin_id])
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_admin
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def authenticate_admin_optional
    token = cookies.signed[:token]
    return unless token

    decoded = JsonWebToken.decode(token)
    return unless decoded && decoded[:type] == 'admin'
    
    @current_admin = Admin.find_by(id: decoded[:admin_id])
  end
end
