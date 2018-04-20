FactoryBot.define do
  factory :user do
    username "qwerty"
    password_digest "@123lol"
    role "instructor"
    email "lol@gmail.com"
    phone "1234657898"
    active true
  end
  factory :student do
    first_name "Zuhair"
    last_name "Ahmad"
    family_id 1
    date_of_birth "2004-04-19"
    rating 1
    active true
  end
  factory :registration do
    camp_id 1
    student_id 1
    payment "gfgsd1242f"
  end
  factory :family do
    family_name "Ahmad"
    parent_first_name "Javed"
    user_id 1
    active true
  end
  
  factory :curriculum do
    name "Mastering Chess Tactics"
    description "This camp is designed for any student who has mastered basic mating patterns and understands opening principles and is looking to improve his/her ability use chess tactics in game situations."
    min_rating 400
    max_rating 850
    active true
  end
  
  factory :instructor do
    first_name "Mark"
    last_name "Heimann"
    bio "Mark is currently among the top 150 players in the United States and has won 4 national scholastic chess championships."
    # phone { rand(10 ** 10).to_s.rjust(10,'0') }
    # email { |i| "#{i.first_name[0]}#{i.last_name}#{(1..99).to_a.sample}@example.com".downcase }
    active true
  end
  
  factory :camp do 
    cost 150
    start_date Date.new(2018,7,16)
    end_date Date.new(2018,7,20)
    time_slot "am"
    max_students 8
    active true
    association :curriculum
    association :location
  end
  
  factory :camp_instructor do 
    association :camp
    association :instructor
  end

  factory :location do
    name "Carnegie Mellon"
    street_1 "5000 Forbes Avenue"
    street_2 "Porter Hall 222"
    city "Pittsburgh"
    state "PA"
    zip "15213"
    max_capacity 16
    active true
  end

end