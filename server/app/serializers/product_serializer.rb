class ProductSerializer
  def self.as_json(product)
    {
      id: product.id,
      seller_id: product.seller_id,
      title: product.title,
      description: product.description,
      price: product.price.to_f,
      is_active: product.is_active,
      created_at: product.created_at,
      updated_at: product.updated_at
    }
  end

  def self.collection(products)
    products.map { |product| as_json(product) }
  end
end
