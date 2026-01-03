'use client';

import { Package } from 'lucide-react';

export function Logo() {
  return (
    <div className="flex items-center justify-center gap-2">
      <div className="w-10 h-10 bg-primary rounded-lg flex items-center justify-center">
        <Package className="w-6 h-6 text-background" />
      </div>
      <span className="text-2xl font-bold text-primary">Food Sales</span>
    </div>
  );
}
