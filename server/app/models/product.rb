class Product < ApplicationRecord
  belongs_to :seller

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :seller_id, presence: true

  scope :active, -> { where(is_active: true) }
  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :by_seller, ->(seller_id) { where(seller_id: seller_id) }

  def soft_delete!
    update!(deleted_at: Time.current, is_active: false)
  end

  def restore!
    update!(deleted_at: nil, is_active: true)
  end

  def deleted?
    deleted_at.present?
  end
end
