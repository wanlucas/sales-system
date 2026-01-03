class SellerSerializer
  def self.as_json(seller)
    {
      id: seller.id,
      name: seller.name,
      email: seller.email,
      phone: seller.phone,
      business_name: seller.business_name,
      document: seller.document,
      is_active: seller.is_active,
      created_at: seller.created_at,
      updated_at: seller.updated_at
    }
  end

  def self.collection(sellers)
    sellers.map { |seller| as_json(seller) }
  end
end
