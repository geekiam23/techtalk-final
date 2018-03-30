# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#


require 'faker'

# Create Users
admin =
1.times do
 user = User.create!(
   name: "Admin User",
   email: "admin@example.com",
   uid: "admin@example.com",
   username: "admin",
   password: "password",
   password_confirmation: "password",
   created_at: Faker::Date.between(2.years.ago, Date.today)
 )
end

# Create Users
100.times do
  email = Faker::Internet.unique.email
  password = Faker::Lorem.characters(8)

 user = User.create!(
   name: Faker::Name.name,
   email: email,
   uid: email,
   username: Faker::Internet.unique.user_name,
   password: password,
   password_confirmation: password,
   created_at: Faker::Date.between(2.years.ago, Date.today)
 )
end

users = User.all

# Create JobPosts
10.times do
  post = Post.create!(
    content_type: JobPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(1, 10)
  )
  JobPost.create!(
    id: post.content_id,
    title: Faker::Job.title,
    body: Faker::ChuckNorris.fact,
    link: Faker::Internet.url,
    salary: Faker::Number.between(60000, 120000),
    location: Faker::Address.city,
    created_at: Faker::Date.between(2.years.ago, Date.today)
    # tag_list: Faker::ProgrammingLanguage.name
  )
end

# Create MeetingPost
10.times do
  post = Post.create!(
    content_type: MeetingPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(11, 21)
  )
  MeetingPost.create!(
    id: post.content_id,
    title: Faker::Lorem.sentence,
    body: Faker::MostInterestingManInTheWorld.quote,
    date: Faker::Date.between(Date.today, 2.year.from_now),
    time: Faker::Time.between(Date.today, 2.year.from_now, :all),
    created_at: Faker::Date.between(2.years.ago, Date.today)
    # tag_list: Faker::ProgrammingLanguage.name
  )
end

# Create PicPost
10.times do
  post = Post.create!(
    content_type: PicPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(22, 32)
  )
  PicPost.create!(
    id: post.content_id,
    image_file_name:   Faker::SlackEmoji.emoji,
    image_content_type: "image/jpeg",
    image_file_size: Faker::Number.between(60000, 120000),
    image_updated_at: Faker::Time.between(2.years.ago, Date.today, :all),
    created_at: Faker::Date.between(2.years.ago, Date.today)
    # tag_list: Faker::Lorem.words
  )
end

# Create ProjectPost
10.times do
  post = Post.create!(
    content_type: ProjectPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(33, 43)
  )
  ProjectPost.create!(
    id: post.content_id,
    title: Faker::HarryPotter.quote,
    body: Faker::Hacker.say_something_smart,
    link: Faker::Internet.url,
    repo: Faker::Internet.url('github.com'),
    created_at: Faker::Date.between(2.years.ago, Date.today)
    # tag_list: Faker::ProgrammingLanguage.name
  )
end

# Create TextPost
10.times do
  post = Post.create!(
    content_type: TextPost,
    user_id: User.ids.sample,
    content_id: Faker::Number.unique.between(44, 54)
  )
  TextPost.create!(
    id: post.content_id,
    body:   Faker::TheFreshPrinceOfBelAir.quote,
    created_at: Faker::Date.between(2.years.ago, Date.today)
    # tag_list: Faker::Lorem.words
  )
end

# Create Followers
300.times do
  FollowingRelationship.create!(
    follower: users.sample,
    followed_user: users.sample
  )
end


# Create Followering Relationship for admin
100.times do
  FollowingRelationship.create!(
    follower: User.first,
    followed_user: users.sample
  )
end

# Create Likes
100.times do
  Like.create!(
    user_id: Faker::Number.unique.between(1, 100),
    post_id: Post.ids.sample,
    created_at: Faker::Date.between(2.years.ago, Date.today)
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Like.count} likes created"
puts "#{FollowingRelationship.count} followers created"
