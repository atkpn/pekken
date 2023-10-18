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

# テストユーザー
test_tarou = User.find_or_create_by!(email: "test_tarou@example.com") do |user|
  user.name ="テスト太郎"
  user.password = "password"
end

test_hanako = User.find_or_create_by!(email: "test_hanako@example.com") do |user|
  user.name ="テスト花子"
  user.password = "password"
end

# ペット情報
hana = Pet.find_or_create_by!(name: "はな") do |pet|
  pet.birthday = Date.new(2023, 5, 1)
  pet.came_day = Date.new(2023, 10, 20)
  pet.kind = "チワワ"
  pet.sex = 1
  pet.user = test_tarou
  pet.pet_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_pet_1.jpg"), filename:"sample_pet_1.jpg")
end

tama = Pet.find_or_create_by!(name: "たま") do |pet|
  pet.birthday = Date.new(2023, 6, 1)
  pet.came_day = Date.new(2023, 11, 20)
  pet.kind = "猫"
  pet.sex = 0
  pet.user = test_tarou
  pet.pet_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_pet_2.jpg"), filename:"sample_pet_2.jpg")
end

poti = Pet.find_or_create_by!(name: "ポチ") do |pet|
  pet.birthday = Date.new(2023, 7, 1)
  pet.came_day = Date.new(2023, 12, 20)
  pet.kind = "犬"
  pet.sex = 0
  pet.user = test_hanako
end

#ペットの全長・体重
hana.body_infos.find_or_create_by!(weight: 1.4, length: 20, memo: "初計測")
hana.body_infos.find_or_create_by!(weight: 1.6, length: 20, memo: "少し成長")
tama.body_infos.find_or_create_by!(weight: 3, length: 30, memo: "")
poti.body_infos.find_or_create_by!(weight: 5.2, length: 40, memo: "初計測")

# えさ
feed_1 = Feed.find_or_create_by!(feed_name: "美味しいチワワの餌") do |f|
  f.maker = "美味しいドッグフードメーカー"
  f.classification = 0
  f.amount = 100
  f.calorie = 400
  f.user = test_tarou
end

feed_2 = Feed.find_or_create_by!(feed_name: "美味しい猫の餌") do |f|
  f.maker = "美味しいキャットフードメーカー"
  f.classification = 0
  f.amount = 100
  f.calorie = 360
  f.user = test_tarou
end

feed_3 = Feed.find_or_create_by!(feed_name: "美味しいおやつ") do |f|
  f.maker = "美味しいドッグフードメーカー"
  f.classification = 1
  f.amount = 100
  f.calorie = 30
  f.user = test_tarou
end

feed_4= Feed.find_or_create_by!(feed_name: "美味しい犬の餌") do |f|
  f.maker = "健康なドッグフードメーカー"
  f.classification = 0
  f.amount = 100
  f.calorie = 300
  f.user = test_hanako
end

# 食事
Meal.find_or_create_by!(amount_eaten: 20, datetime: DateTime.new(2023, 10, 20, 19, 10)) do |meal|
  meal.pet = hana
  meal.feed = feed_1
end

Meal.find_or_create_by!(amount_eaten: 20, datetime: DateTime.new(2023, 10, 20, 12, 00)) do |meal|
  meal.pet = hana
  meal.feed = feed_3
end

Meal.find_or_create_by!(amount_eaten: 20, datetime: DateTime.new(2023, 11, 29, 19, 10)) do |meal|
  meal.pet = tama
  meal.feed = feed_2
end

Meal.find_or_create_by!(amount_eaten: 20, datetime: DateTime.new(2023, 10, 20, 19, 10)) do |meal|
  meal.pet = poti
  meal.feed = feed_4
end

# お手入れ項目(自分のテンプレート)
clinic = CareItem.find_or_create_by!(name: "病院") do |care_item|
  care_item.default_item = false
  care_item.user = test_tarou
end

molting_period = CareItem.find_or_create_by!(name: "換毛期") do |care_item|
  care_item.unit = "日"
  care_item.default_item = false
  care_item.user = test_tarou
end

# お手入れ項目
care_hana_clinic = Care.find_or_create_by!(pet: hana, care_item: clinic)
care_hana_molting = Care.find_or_create_by!(pet: hana, care_item: molting_period)
care_tama_molting = Care.find_or_create_by!(pet: tama, care_item: molting_period)

# お手入れ記録
PetCare.find_or_create_by!(pet_id: hana.id, care: care_hana_clinic) do |pet_care|
  pet_care.value = "空欄でも可"
  pet_care.memo = "注射をした"
  pet_care.date_time = DateTime.new(2023, 11, 1, 11, 00)
end

PetCare.find_or_create_by!(pet_id: hana.id, care: care_hana_clinic) do |pet_care|
  pet_care.value = "空欄でも可"
  pet_care.memo = "経過観察"
  pet_care.date_time = DateTime.new(2023, 11, 7, 11, 00)
end

PetCare.find_or_create_by!(pet_id: hana.id, care: care_hana_molting) do |pet_care|
  pet_care.value = "空欄でも可"
  pet_care.memo = "たくさん抜けた"
  pet_care.date_time = DateTime.new(2023, 10, 30, 20, 00)
end

PetCare.find_or_create_by!(pet_id: tama.id, care: care_tama_molting) do |pet_care|
  pet_care.value = "１０〜１１月"
  pet_care.memo = "ブラシを嫌がる"
  pet_care.date_time = DateTime.new(2023, 11, 30, 20, 00)
end
