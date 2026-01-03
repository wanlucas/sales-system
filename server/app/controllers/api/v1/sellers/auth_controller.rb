module Api
  module V1
    module Sellers
      class AuthController < BaseController
        skip_before_action :authenticate_seller, only: [:login, :register]

        def login
          seller = Seller.find_by(email: params[:email]&.downcase)

          if seller&.authenticate(params[:password])
            token = JsonWebToken.encode(seller_id: seller.id, type: 'seller')
            
            cookies.signed[:token] = {
              value: token,
              httponly: true,
              secure: Rails.env.production?,
              same_site: :lax,
              expires: 24.hours.from_now
            }

            render json: {
              data: SellerSerializer.as_json(seller)
            }, status: :ok
          else
            render json: { error: 'Email ou senha inválidos' }, status: :unauthorized
          end
        end

        def register
          seller_data = seller_params
          seller = Seller.new(seller_data)

          if seller.save
            token = JsonWebToken.encode(seller_id: seller.id, type: 'seller')
            
            cookies.signed[:token] = {
              value: token,
              httponly: true,
              secure: Rails.env.production?,
              same_site: :lax,
              expires: 7.days.from_now
            }

            render json: {
              data: SellerSerializer.as_json(seller)
            }, status: :created
          else
            render json: { error: seller.errors.full_messages.first }, status: :unprocessable_entity
          end
        end

        def logout
          cookies.delete(:token)
          render status: :ok
        end

        def me
          render json: {
            data: SellerSerializer.as_json(current_seller)
          }, status: :ok
        end

        private

        def seller_params
          params.permit(:name, :email, :phone, :business_name, :document, :password)
        end
      end
    end
  end
end
