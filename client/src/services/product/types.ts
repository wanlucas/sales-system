export interface Product {
  id: string;
  name: string;
  description: string;
  base_price: number;
  image_url: string;
  category: string;
  is_available: boolean;
  seller_id: string;
  created_at: string;
  updated_at: string;
}

export interface ProductComplement {
  id: string;
  product_id: string;
  name: string;
  description: string;
  price: number;
  stock_quantity: number;
  is_available: boolean;
  max_quantity: number;
  created_at: string;
  updated_at: string;
}

export interface ProductWithComplements extends Product {
  complements: ProductComplement[];
}

export type CreateProductInput = Omit<Product, 'id' | 'created_at' | 'updated_at'>;
export type UpdateProductInput = Partial<Product>;
