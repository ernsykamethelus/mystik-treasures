crystals = ['Jasper', 'Obsidian', 'Citrine', 'Turquoise', 
'Moonstone', 'Bloodstone', 'Sapphire', 'Ruby', 'Amethyst', 'Tigers Eye']

purpose = ['empowering', 'protective', 'optimism', 'grounding', 'growth', 
    'strenghten', 'prosperity', 'vitality', 'purifying', 'harmonizing']

    # org_crystals.each {|name| User.create(org_crystal: name)}
    

    crystals.each.with_index do |el, i|
        name = crystals[i]
        purpose = crystals.sample(1)[0]
        user_id = [1,2].sample

        Crystal.create(purpose: purpose, user_id: user_id, name: name)
    end