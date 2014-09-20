namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_posts
    
  end
end

def make_users

  5.times do |n|
    
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(username:     "sample John",
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_posts
  users = User.all
  20.times do |n|
    field = "field #{n+1}"
    title = "title #{n+1}"
    users.each { |user| user.posts.create!(
      title: title,
      :field => field, 
      :begin_date => "12/10/2014",
     
      
      :gender => "male", 
      :description => "something fun", 
      :time_needed => n+1,
      :location => "los angeles", 
      :study_id => "gh33333#{n+1}"
      ) }
  end
end