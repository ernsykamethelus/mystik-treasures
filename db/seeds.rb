crystals = ['Jasper', 'Obsidian', 'Citrine', 'Turquoise', 
'Moonstone', 'Bloodstone', 'Sapphire', 'Ruby', 'Amethyst', 'Tigers Eye']

purpose = ['empowering', 'protective', 'optimism', 'grounding', 'growth', 
    'strenghten', 'prosperity', 'vitality', 'purifying', 'harmonizing']

    # org_crystals.each {|name| User.create(org_crystal: name)}
    User.create(username: "test4", email: "test4@gmail.com", password: "how4")
    User.create(username: "bhellax",email: "ernsykamethelus@yahoo.com", password: "Hellokitty18!")
    User.create(username: "test1",email: "test1@gmail.com", password: "Hellokitty20!")
    User.create(username: "test2",email: "test2@gmail.com", password: "test2")


    crystals.each.with_index do |el, i|
        name = crystals[i]
        purpose = crystals.sample(1)[0]
        user_id = [1,2].sample

        Crystal.create(purpose: purpose, user_id: user_id, name: name)
    end