require 'faker'

15.times do |i|
    @user = User.create(username: "user#{i+1}", email: "user#{i+1}@user.com", password: "password")
    13.times do |c|
      @crystal = Crystal.create(name: "name", purpose: "purpose")
    end
  end

    # crystals.each.with_index do |el, i|
    #     name = crystals[i]
    #     purpose = crystals.sample(1)[0]
    #     user_id = [1,2].sample

    #     Crystal.create(purpose: purpose, user_id: user_id, name: name)
    # end

    