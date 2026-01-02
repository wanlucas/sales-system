export interface Complement {
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

export type CreateComplementInput = Omit<Complement, 'id' | 'created_at' | 'updated_at'>;
export type UpdateComplementInput = Partial<Complement>;
