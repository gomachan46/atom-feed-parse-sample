# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
  { term: 'entertainment', label: 'エンタメ' },
  { term: 'sports', label: 'スポーツ' },
  { term: 'technology', label: 'テクノロジー・科学' },
  { term: 'economy', label: '経済' },
  { term: 'domestic', label: '国内' },
  { term: 'overseas', label: '海外' },
  { term: 'life', label: 'ライフ・美容' },
  { term: 'other', label: 'その他' }
])
