# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.destroy_all
Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD']
)

CareItem.destroy_all
CareItem.create!(
  [
    {name: "爪切り", default_item: true},
    {name: "耳掃除", default_item: true},
    {name: "歯磨き", default_item: true},
    {name: "お風呂", default_item: true},
    {name: "ブラッシング", default_item: true},
    {name: "トリミング", default_item: true},
    {name: "お掃除", default_item: true},
    {name: "嘔吐", default_item: true},
    {name: "体調不良", default_item: true},
    {name: "ワクチン", default_item: true},
    {name: "トイレ", default_item: true},
    {name: "運動・散歩", unit: "時間", default_item: true},
    {name: "体温", unit: "℃", default_item: true},
    {name: "薬", default_item: true},
  ]
)