class Seller < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :document, uniqueness: true, allow_nil: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  before_validation :normalize_email
  before_save :encrypt_password, if: :password_changed?

  attr_accessor :password_plain

  scope :active, -> { where(is_active: true) }
  scope :not_deleted, -> { where(deleted_at: nil) }

  def authenticate(plain_password)
    BCrypt::Password.new(password) == plain_password
  rescue BCrypt::Errors::InvalidHash
    false
  end

  def soft_delete!
    update!(deleted_at: Time.current, is_active: false)
  end

  def restore!
    update!(deleted_at: nil, is_active: true)
  end

  def deleted?
    deleted_at.present?
  end

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end

  def encrypt_password
    self.password = BCrypt::Password.create(password_plain || password)
  end

  def password_changed?
    password_plain.present? || (new_record? && password.present?)
  end

  def password_required?
    new_record? || password_plain.present?
  end
end
