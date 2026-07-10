# Create a main sample user.
User.create!(name: "Daniel Park",
             email: "daniel@test.com",
             password: "asdfasdf",
             password_confirmation: "asdfasdf",
             admin: true)

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "elpis-#{n+1}@kainos.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
