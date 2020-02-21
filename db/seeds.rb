puts "Reading ingredients from remote json"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get(url)
json = JSON.parse(response.body, symbolize_names: true)

puts "Destroying all cocktails"
Cocktail.destroy_all

puts "Destroying all ingredients"
Ingredient.destroy_all

puts "Creating ingredients"
json[:drinks].each do |drink|
  name = drink[:strIngredient1]
  Ingredient.create!(name: name)
end

puts 'Destroying poisonous doses'
Dose.destroy_all
Dose.create(description: '', cocktail: Cocktail.first)

puts "Creating some cocktails"
20.times do
  first = Faker::Music.instrument
  second = Faker::Games::Heroes.name

  Cocktail.create!(name: "#{first} #{second}")
end

puts "Done 🍸"
