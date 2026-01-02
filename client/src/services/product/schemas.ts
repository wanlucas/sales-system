import { z } from 'zod';

export const productSchema = z.object({
  id: z.string(),
  name: z.string().min(1, 'Name is required'),
  description: z.string().min(1, 'Description is required'),
  base_price: z.number().positive('Price must be positive'),
  image_url: z.string().url('Invalid image URL'),
  category: z.string().min(1, 'Category is required'),
  is_available: z.boolean(),
  seller_id: z.string(),
  created_at: z.string(),
  updated_at: z.string(),
});

export const createProductSchema = productSchema.omit({
  id: true,
  created_at: true,
  updated_at: true,
});

export const updateProductSchema = productSchema.partial();

export const productComplementSchema = z.object({
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
