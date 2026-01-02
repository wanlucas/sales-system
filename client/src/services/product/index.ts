import { Product, ProductWithComplements, ProductComplement, CreateProductInput, UpdateProductInput } from './types';

const mockProducts: Product[] = [
  {
    id: '1',
    name: 'Acai Bowl 300ml',
    description: 'Traditional acai bowl with guarana',
    base_price: 15.00,
    image_url: '/products/acai-300ml.jpg',
    category: 'acai',
    is_available: true,
    seller_id: 'seller-1',
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: '2',
    name: 'Acai Bowl 500ml',
    description: 'Large acai bowl with guarana',
    base_price: 22.00,
    image_url: '/products/acai-500ml.jpg',
    category: 'acai',
    is_available: true,
    seller_id: 'seller-1',
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: '3',
    name: 'Smoothie Bowl',
    description: 'Mixed fruits smoothie bowl',
    base_price: 18.00,
    image_url: '/products/smoothie.jpg',
    category: 'smoothie',
    is_available: true,
    seller_id: 'seller-1',
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
];

const mockComplements: ProductComplement[] = [
  {
    id: 'comp-1',
    product_id: '1',
    name: 'Granola',
    description: 'Crunchy granola topping',
    price: 3.00,
    stock_quantity: 50,
    is_available: true,
    max_quantity: 3,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'comp-2',
    product_id: '1',
    name: 'Banana',
    description: 'Fresh sliced banana',
    price: 2.00,
    stock_quantity: 30,
    is_available: true,
    max_quantity: 2,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'comp-3',
    product_id: '1',
    name: 'Strawberry',
    description: 'Fresh strawberries',
    price: 4.00,
    stock_quantity: 20,
    is_available: true,
    max_quantity: 2,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'comp-4',
    product_id: '1',
    name: 'Honey',
    description: 'Natural honey drizzle',
    price: 2.50,
    stock_quantity: 40,
    is_available: true,
    max_quantity: 1,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'comp-5',
    product_id: '2',
    name: 'Granola',
    description: 'Crunchy granola topping',
    price: 3.00,
    stock_quantity: 50,
    is_available: true,
    max_quantity: 3,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'comp-6',
    product_id: '2',
    name: 'Peanut Butter',
    description: 'Creamy peanut butter',
    price: 5.00,
    stock_quantity: 25,
    is_available: true,
    max_quantity: 2,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
];

export async function list(): Promise<Product[]> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return mockProducts;
}

export async function getById(id: string): Promise<ProductWithComplements | null> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const product = mockProducts.find(p => p.id === id);
  if (!product) return null;

  const complements = mockComplements.filter(c => c.product_id === id);
  return { ...product, complements };
}

export async function getByCategory(category: string): Promise<Product[]> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return mockProducts.filter(p => p.category === category);
}

export async function create(data: CreateProductInput): Promise<Product> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const newProduct: Product = {
    ...data,
    id: `product-${Date.now()}`,
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  };
  mockProducts.push(newProduct);
  return newProduct;
}

export async function update(id: string, data: UpdateProductInput): Promise<Product | null> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const index = mockProducts.findIndex(p => p.id === id);
  if (index === -1) return null;

  mockProducts[index] = {
    ...mockProducts[index],
    ...data,
    updated_at: new Date().toISOString(),
  };
  return mockProducts[index];
}

export async function remove(id: string): Promise<boolean> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const index = mockProducts.findIndex(p => p.id === id);
  if (index === -1) return false;
  mockProducts.splice(index, 1);
  return true;
}
