module Api
  module V1
    module Users
      class BaseController < ApplicationController
        include UserAuthentication
        
        before_action :authenticate_user
      end
    end
  end
end
