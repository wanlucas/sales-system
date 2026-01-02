module Repositories
  class SellerRepository < BaseRepository
    def initialize
      super(Seller)
    end

    def find_by_email(email)
      find_by(email: email.downcase.strip)
    end

    def find_by_document(document)
      find_by(document: document)
    end

    def active_sellers
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

      Domain::Sellers::Seller.new(
        id: record.id,
        name: record.name,
        email: record.email,
        phone: record.phone,
        business_name: record.business_name,
        document: record.document,
        is_active: record.is_active,
        deleted_at: record.deleted_at,
        created_at: record.created_at,
        updated_at: record.updated_at
      )
    end
  end
end
