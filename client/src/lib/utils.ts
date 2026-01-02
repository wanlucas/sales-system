/**
 * Format price to currency string
 */
export const formatPrice = (price: number, currency = '$'): string => {
  return `${currency}${price.toFixed(2)}`;
};

/**
 * Calculate total price with complements
 */
export const calculateTotal = (
  basePrice: number,
  complements: Array<{ price: number; quantity: number }>
): number => {
  const complementsTotal = complements.reduce(
    (sum, comp) => sum + comp.price * comp.quantity,
    0
  );
  return basePrice + complementsTotal;
};
