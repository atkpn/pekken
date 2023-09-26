# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.destroy_all
Admin.create!(
  email: "krni.ot.112@gmail.com",
  password: "admin_pekken"
)

DefaultItem.create!(
  [
    {name: "爪切り"},
    {name: "耳掃除"},
    {name: "歯磨き"},
    {name: "お風呂"},
    {name: "ブラッシング"},
    {name: "トリミング"},
    {name: "お掃除"},
    {name: "嘔吐"},
    {name: "体調不良"},
    {name: "ワクチン"},
    {name: "トイレ"},
    {name: "運動・散歩", unit: "時間"},
    {name: "体温", unit: "℃"},
    {name: "薬"},
  ]
)