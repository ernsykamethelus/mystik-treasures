org_crystals = ['Jasper', 'Obsidian', 'Citrine', 'Turquoise', 
'Moonstone', 'Bloodstone', 'Sapphire', 'Ruby', 'Amethyst', 'Tigers Eye']

crystals = ['empowering', 'protective', 'optimism', 'grounding', 'growth', 
    'strenghten', 'prosperity', 'vitality', 'purifying', 'harmonizing']

    # org_crystals.each {|name| User.create(org_crystal: name)}

    crystals.each.with_index do |el, i|
        name = org_crystals[i]
        crystal = org_crystals.sample(1)[0]
        id = org_crystals.index(crystal) + 1

        Crystals.create(purpose: el, user_id: id, name: name)

    end