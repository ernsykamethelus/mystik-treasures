require 'faker'

5.times do |i|
    @user = User.create(username: "user#{i+1}", email: "user#{i+1}@user.com", password: "password")
    3.times do |c|
      @crystal = Crystal.create(user_id: i+1, name: "name", purpose: "purpose")
    end
  end

