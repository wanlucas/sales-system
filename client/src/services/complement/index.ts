import {
  Complement,
  CreateComplementInput,
  UpdateComplementInput,
} from "./types";

const mockComplements: Complement[] = [
  {
    id: "comp-1",
    product_id: "1",
    name: "Granola",
    description: "Crunchy granola topping",
    price: 3.0,
    stock_quantity: 50,
    is_available: true,
    max_quantity: 3,
    created_at: "2024-01-01T00:00:00Z",
    updated_at: "2024-01-01T00:00:00Z",
  },
  {
    id: "comp-2",
    product_id: "1",
    name: "Banana",
    description: "Fresh sliced banana",
    price: 2.0,
    stock_quantity: 30,
    is_available: true,
    max_quantity: 2,
    created_at: "2024-01-01T00:00:00Z",
    updated_at: "2024-01-01T00:00:00Z",
  },
  {
    id: "comp-3",
    product_id: "1",
    name: "Strawberry",
    description: "Fresh strawberries",
    price: 4.0,
    stock_quantity: 20,
    is_available: true,
    max_quantity: 2,
    created_at: "2024-01-01T00:00:00Z",
    updated_at: "2024-01-01T00:00:00Z",
  },
  {
    id: "comp-4",
    product_id: "1",
    name: "Honey",
    description: "Natural honey drizzle",
    price: 2.5,
    stock_quantity: 40,
    is_available: true,
    max_quantity: 1,
    created_at: "2024-01-01T00:00:00Z",
    updated_at: "2024-01-01T00:00:00Z",
  },
  {
    id: "comp-5",
    product_id: "2",
    name: "Granola",
    description: "Crunchy granola topping",
    price: 3.0,
    stock_quantity: 50,
    is_available: true,
    max_quantity: 3,
    created_at: "2024-01-01T00:00:00Z",
    updated_at: "2024-01-01T00:00:00Z",
  },
  {
    id: "comp-6",
    product_id: "2",
    name: "Peanut Butter",
    description: "Creamy peanut butter",
    price: 5.0,
    stock_quantity: 25,
    is_available: true,
    max_quantity: 2,
    created_at: "2024-01-01T00:00:00Z",
    updated_at: "2024-01-01T00:00:00Z",
  },
];

export async function getByProductId(productId: string): Promise<Complement[]> {
  await new Promise((resolve) => setTimeout(resolve, 300));
  return mockComplements.filter(
    (c) => c.product_id === productId && c.is_available
  );
}

export async function getById(id: string): Promise<Complement | null> {
  await new Promise((resolve) => setTimeout(resolve, 300));
  return mockComplements.find((c) => c.id === id) || null;
}

export async function create(data: CreateComplementInput): Promise<Complement> {
  await new Promise((resolve) => setTimeout(resolve, 300));
  const newComplement: Complement = {
    ...data,
    id: `comp-${Date.now()}`,
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  };
  mockComplements.push(newComplement);
  return newComplement;
}

export async function update(
  id: string,
  data: UpdateComplementInput
): Promise<Complement | null> {
  await new Promise((resolve) => setTimeout(resolve, 300));
  const index = mockComplements.findIndex((c) => c.id === id);
  if (index === -1) return null;

  mockComplements[index] = {
    ...mockComplements[index],
    ...data,
    updated_at: new Date().toISOString(),
  };
  return mockComplements[index];
}

export async function remove(id: string): Promise<boolean> {
  await new Promise((resolve) => setTimeout(resolve, 300));
  const index = mockComplements.findIndex((c) => c.id === id);
  if (index === -1) return false;
  mockComplements.splice(index, 1);
  return true;
}
