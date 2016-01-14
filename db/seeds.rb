# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  email: 'brayzen@github.com',
  password: 'password',
  role: 'editor',
  name: 'Brian Ray',
  )


30.times do
  User.create(
    email: 'john.doe@example.com',
    password: 'password',
    role: 'author',
    name: Faker::Name.name,
    )
end

30.times do
  User.create(
    email: 'jane.visitor@example.com',
    password: 'password',
    role: 'visitor',
    name: Faker::Name.name,
    )
end

30.times do
  Article.create(
    title: Faker::Lorem.sentence(rand(8)),
    body: Faker::Lorem.paragraph(rand(3)),
    author_id: rand(31..60),
    published: true,
    )
end

20.times do
  Article.create(
    title: Faker::Lorem.sentence(rand(8)),
    body: Faker::Lorem.paragraph(rand(3)),
    author_id: rand(31..60),
    published: nil,
    )
end


100.times do
  Comment.create(
    post: Faker::Lorem.sentence(rand(1..10)),
    verified: true,
    article: Article.all.sample,
    user: User.all.sample,
    )
end
