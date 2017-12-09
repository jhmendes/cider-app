# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ciders = [
 ["Woodchuck", "Amber", "5.5%", "Year Round", "Amber, Woodchuck's original cider, remains the same today as those first hand-filled bottles in 1991. Fiercely crafted with a medium body, golden hue, and refreshing red apple finish. Enjoy the brand that started the American cider revolution."],
 ["Downeast", "Winter blend", "5.6%", "Winder", "A reward for all that shoveling.  We keep it interesting with toasted oak chips, cinnamon bark, nutmeg, and a little extra kick to help forget you have to go back out there."]
]

ciders.each do |cider_info|
  company, style, abv, season, description = cider_info
  Cider.create!(company: company, style: style, abv: abv, season: season, description: description)
end
