import { z } from 'zod';

export const sellerSchema = z.object({
  id: z.string(),
  name: z.string().min(1, 'Name is required'),
  email: z.string().email('Invalid email address'),
  phone: z.string().min(1, 'Phone is required'),
  business_name: z.string().min(1, 'Business name is required'),
  created_at: z.string(),
  updated_at: z.string(),
});

export const createSellerSchema = sellerSchema.omit({
  id: true,
  created_at: true,
  updated_at: true,
});

export const updateSellerSchema = sellerSchema.partial();
