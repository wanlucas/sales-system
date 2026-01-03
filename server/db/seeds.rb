# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🌱 Iniciando seeds..."

# Limpar dados existentes
puts "🗑️  Limpando dados existentes..."
Product.destroy_all
Seller.destroy_all

# Criar vendedores
puts "👤 Criando vendedores..."

seller1 = Seller.create!(
  name: "Maria Silva",
  email: "maria@acai.com",
  phone: "11987654321",
  business_name: "Açaí da Maria",
  document: "12345678901",
  password: "senha123"
)

seller2 = Seller.create!(
  name: "João Santos",
  email: "joao@salgados.com",
  phone: "11976543210",
  business_name: "Salgados do João",
  document: "98765432109",
  password: "senha123"
)

puts "✅ #{Seller.count} vendedores criados"

# Criar produtos de açaí
puts "🍇 Criando produtos de açaí..."

Product.create!([
  {
    seller: seller1,
    title: "Açaí 300ml",
    description: "Açaí puro, cremoso e delicioso. Acompanha granola e banana.",
    price: 15.90
  },
  {
    seller: seller1,
    title: "Açaí 500ml",
    description: "Açaí tradicional com frutas e granola. Perfeito para matar a fome!",
    price: 22.90
  },
  {
    seller: seller1,
    title: "Açaí 700ml",
    description: "Açaí grande com até 3 acompanhamentos à sua escolha.",
    price: 29.90
  },
  {
    seller: seller1,
    title: "Açaí Premium 500ml",
    description: "Açaí premium com frutas especiais, pasta de amendoim e chocolate.",
    price: 32.90
  },
  {
    seller: seller1,
    title: "Bowl de Açaí Fitness",
    description: "Açaí com granola sem açúcar, frutas orgânicas e mel.",
    price: 27.90
  }
])

# Criar produtos de salgados
puts "🥟 Criando produtos de salgados..."

Product.create!([
  {
    seller: seller2,
    title: "Coxinha de Frango",
    description: "Coxinha tradicional de frango com catupiry. Crocante e saborosa!",
    price: 6.50
  },
  {
    seller: seller2,
    title: "Pastel de Carne",
    description: "Pastel de carne moída temperada. Massa fina e crocante.",
    price: 7.00
  },
  {
    seller: seller2,
    title: "Esfiha de Carne",
    description: "Esfiha aberta com carne temperada e especiarias.",
    price: 5.50
  },
  {
    seller: seller2,
    title: "Kibe Assado",
    description: "Kibe assado recheado com carne e temperado com especiarias.",
    price: 8.00
  },
  {
    seller: seller2,
    title: "Enroladinho de Salsicha",
    description: "Salsicha envolta em massa folhada. Ideal para festas!",
    price: 4.50
  },
  {
    seller: seller2,
    title: "Risoles de Presunto e Queijo",
    description: "Risoles cremosos de presunto e queijo. Empanado na hora.",
    price: 6.00
  },
  {
    seller: seller2,
    title: "Bolinha de Queijo",
    description: "Bolinhas de queijo empanadas e fritas. Irresistíveis!",
    price: 5.00
  },
  {
    seller: seller2,
    title: "Combo Salgados (10 unidades)",
    description: "Mix de salgados variados. Você escolhe os sabores!",
    price: 55.00
  }
])

puts "✅ #{Product.count} produtos criados"
puts "🎉 Seeds concluídas com sucesso!"
puts ""
puts "📊 Resumo:"
puts "   - #{Seller.count} vendedores"
puts "   - #{Product.count} produtos"
puts ""
puts "🔐 Credenciais de acesso:"
puts "   Açaí da Maria: maria@acai.com / senha123"
puts "   Salgados do João: joao@salgados.com / senha123"
