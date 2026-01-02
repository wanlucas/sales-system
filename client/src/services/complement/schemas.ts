import { z } from 'zod';

export const complementSchema = z.object({
  id: z.string(),
  product_id: z.string(),
  name: z.string().min(1, 'Name is required'),
  description: z.string().min(1, 'Description is required'),
  price: z.number().positive('Price must be positive'),
  stock_quantity: z.number().int().nonnegative('Stock must be non-negative'),
  is_available: z.boolean(),
  max_quantity: z.number().int().positive('Max quantity must be positive'),
  created_at: z.string(),
  updated_at: z.string(),
});

export const createComplementSchema = complementSchema.omit({
  id: true,
  created_at: true,
  updated_at: true,
});

export const updateComplementSchema = complementSchema.partial();
