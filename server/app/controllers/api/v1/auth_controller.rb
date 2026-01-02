module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_request, only: [:login, :register]

      def login
        seller = Seller.find_by(email: params[:email]&.downcase)

        if seller&.authenticate(params[:password])
          token = JsonWebToken.encode(seller_id: seller.id)
          
          cookies.signed[:token] = {
            value: token,
            httponly: true,
            secure: Rails.env.production?,
            same_site: :lax,
            expires: 24.hours.from_now
          }

          render json: {
            message: 'Login successful',
            seller: Serializers::SellerSerializer.as_json(seller)
          }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def register
        seller = Seller.new(seller_params)
        seller.password_plain = params[:password]

        if seller.save
          token = JsonWebToken.encode(seller_id: seller.id)
          
          cookies.signed[:token] = {
            value: token,
            httponly: true,
            secure: Rails.env.production?,
            same_site: :lax,
            expires: 24.hours.from_now
          }

          render json: {
            message: 'Registration successful',
            seller: Serializers::SellerSerializer.as_json(seller)
          }, status: :created
        else
          render json: { errors: seller.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def logout
        cookies.delete(:token)
        render json: { message: 'Logged out successfully' }, status: :ok
      end

      def me
        render json: {
          seller: Serializers::SellerSerializer.as_json(current_seller)
        }, status: :ok
      end

      private

      def seller_params
        params.permit(:name, :email, :phone, :business_name, :document)
      end
    end
  end
end
