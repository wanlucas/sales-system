module Api
  module V1
    module Sellers
      class BaseController < ApplicationController
        include SellerAuthentication
        
        before_action :authenticate_seller
      end
    end
  end
end
