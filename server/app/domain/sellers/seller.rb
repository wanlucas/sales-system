module Domain
  module Sellers
    class Seller
      attr_reader :id, :name, :email, :phone, :business_name, :document, :is_active, :deleted_at, :created_at, :updated_at

      def initialize(id:, name:, email:, phone:, business_name:, document: nil, is_active: true, deleted_at: nil, created_at: nil, updated_at: nil)
        @id = id
        @name = name
        @email = email
        @phone = phone
        @business_name = business_name
        @document = document
        @is_active = is_active
        @deleted_at = deleted_at
        @created_at = created_at
        @updated_at = updated_at
      end

      def valid?
        name.present? && email.present? && phone.present?
      end

      def active?
        is_active == true
      end

      def deleted?
        deleted_at.present?
      end
    end
  end
end
