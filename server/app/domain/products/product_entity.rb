module Domain
  module Products
    class ProductEntity
      attr_reader :id, :seller_id, :title, :description, :price, :is_active, :deleted_at, :created_at, :updated_at

      def initialize(id:, seller_id:, title:, price:, description: nil, is_active: true, deleted_at: nil, created_at: nil, updated_at: nil)
        @id = id
        @seller_id = seller_id
        @title = title
        @description = description
        @price = price
        @is_active = is_active
        @deleted_at = deleted_at
        @created_at = created_at
        @updated_at = updated_at
      end

      def valid?
        title.present? && price.present? && seller_id.present?
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
