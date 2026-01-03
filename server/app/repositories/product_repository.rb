module Repositories
  class ProductRepository < BaseRepository
    def initialize
      super(Product)
    end

    def find_by_seller(seller_id)
      @model_class.by_seller(seller_id).active.not_deleted
    end

    def find_by_id_and_seller(id, seller_id)
      @model_class.find_by(id: id, seller_id: seller_id)
    end

    def active_products
      @model_class.active.not_deleted
    end

    def soft_delete(id)
      record = find(id)
      record.soft_delete!
      record
    end

    def restore(id)
      record = @model_class.find_by(id: id)
      raise Exceptions::RecordNotFound unless record
      record.restore!
      record
    end

    def to_entity(record)
      return nil unless record

      Domain::Products::ProductEntity.new(
        id: record.id,
        seller_id: record.seller_id,
        title: record.title,
        description: record.description,
        price: record.price,
        is_active: record.is_active,
        deleted_at: record.deleted_at,
        created_at: record.created_at,
        updated_at: record.updated_at
      )
    end
  end
end
