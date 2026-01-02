export interface Seller {
  id: string;
  name: string;
  email: string;
  phone: string;
  business_name: string;
  created_at: string;
  updated_at: string;
}

export type CreateSellerInput = Omit<Seller, 'id' | 'created_at' | 'updated_at'>;
export type UpdateSellerInput = Partial<Seller>;
