# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
Category.destroy_all

categories = [
  "Vehículos",
  "Inmuebles",
  "Supermercado",
  "Tecnología",
  "Accesorios para Vehículos",
  "Electrodomésticos",
  "Hogar y Muebles",
  "Belleza y Cuidado personal",
  "Moda",
  "Juegos y Juguetes",
  "Deportes y Fitness",
  "Mascotas",
  "Herramientas",
  "Construcción",
  "Compra Internacional",
  "Farmacias",
  "Salud y Equipamiento Médico",
  "Productos Sustentables",
  "Industrias y Oficinas",
  "Tiendas oficiales"
]

categories.each do |category|
  Category.create(name: category)
end