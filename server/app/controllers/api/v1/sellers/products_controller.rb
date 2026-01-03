module Api
  module V1
    module Sellers
      class ProductsController < BaseController
        before_action :set_product, only: [:show, :update, :destroy]

        def index
          products = current_seller.products.active.not_deleted
          render json: {
            data: ProductSerializer.collection(products)
          }, status: :ok
        end

        def show
          render json: {
            data: ProductSerializer.as_json(@product)
          }, status: :ok
        end

        def create
          product = current_seller.products.build(product_params)

          if product.save
            render json: {
              data: ProductSerializer.as_json(product)
            }, status: :created
          else
            render json: { error: product.errors.full_messages.first }, status: :unprocessable_entity
          end
        end

        def update
          if @product.update(product_params)
            render json: {
              data: ProductSerializer.as_json(@product)
            }, status: :ok
          else
            render json: { error: @product.errors.full_messages.first }, status: :unprocessable_entity
          end
        end

        def destroy
          @product.soft_delete!
          render status: :no_content
        end

        private

        def set_product
          @product = current_seller.products.active.not_deleted.find_by(id: params[:id])
          render json: { error: 'Produto não encontrado' }, status: :not_found unless @product
        end

        def product_params
          params.permit(:title, :description, :price)
        end
      end
    end
  end
end
