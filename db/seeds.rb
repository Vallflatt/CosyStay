# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flat.destroy_all if Rails.env.development?

Flat.create(title: "La Villa Robin", description: "Beautiful with amazing view", street: "Lac 12", city: "St-Cergues", country: "Switzerland", img_url: "https://images.unsplash.com/photo-1551354907-80361e454f5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", price: 600)
Flat.create(title: "Drilon house", description: "Terrible experience", street: "Les Pâquis 4", city: "Geneva", country: "France", img_url: "https://images.unsplash.com/photo-1596573513513-d56b3999ac38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80", price: 50)
Flat.create(title: "Virginie Castle", description: "Haunted, I don't recommand", street: "Sauvabelin 2", city: "Lausanne", country: "Suisse", img_url: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=768&q=80", price: 900)
Flat.create(title: "David hut", description: "Very nice place", street: "?", city: "Prypiat", country: "Ukraine", img_url: "https://images.unsplash.com/photo-1596401508552-72263942db7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80", price: 5)
Flat.create(title: "Le Wagon", description: "Super cosy", street: "Lausanne 64", city: "Renens", country: "Suisse", img_url: "https://static.wikia.nocookie.net/breakingbad/images/d/d6/RV.jpg/revision/latest?cb=20130724193305", price: 100)
