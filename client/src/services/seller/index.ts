import { Seller, CreateSellerInput, UpdateSellerInput } from './types';

const mockSellers: Seller[] = [
  {
    id: 'seller-1',
    name: 'John Doe',
    email: 'john@acaishop.com',
    phone: '+1234567890',
    business_name: 'Acai Paradise',
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
];

export async function getById(id: string): Promise<Seller | null> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return mockSellers.find(s => s.id === id) || null;
}

export async function getByEmail(email: string): Promise<Seller | null> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return mockSellers.find(s => s.email === email) || null;
}

export async function list(): Promise<Seller[]> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return mockSellers;
}

export async function create(data: CreateSellerInput): Promise<Seller> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const newSeller: Seller = {
    ...data,
    id: `seller-${Date.now()}`,
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  };
  mockSellers.push(newSeller);
  return newSeller;
}

export async function update(id: string, data: UpdateSellerInput): Promise<Seller | null> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const index = mockSellers.findIndex(s => s.id === id);
  if (index === -1) return null;

  mockSellers[index] = {
    ...mockSellers[index],
    ...data,
    updated_at: new Date().toISOString(),
  };
  return mockSellers[index];
}

export async function remove(id: string): Promise<boolean> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const index = mockSellers.findIndex(s => s.id === id);
  if (index === -1) return false;
  mockSellers.splice(index, 1);
  return true;
}
