5.times do |i|
    @user = User.create(username: "user#{i+1}", email: "user#{i+1}@user.com", password: "password")
    3.times do |c|
      @crystal = Crystal.create(user_id: i+1, name: "name", purpose: "purpose")
    end
  end

  Crystal.create(name: "Jasper", purpose: "To empower the spirit and support you through times of stress by preparing you to fully “show up.”", user_id: 1)
  Crystal.create(name: "Obsidian",purpose: "Obsidian is said to help form a shield against physical and emotional negativity. ", user_id: 1)
  Crystal.create(name: "Citrine",purpose: "Bring joy, wonder, and enthusiasm to every part of your life with citrine. It’s said to help you release negative traits from your life.", user_id: 1)
  Crystal.create(name: "Turquoise",purpose: "It is said to help heal the mind, body, and soul.", user_id: 2)
  Crystal.create(name: "Moonstone", purpose: "Moonstone is known for “new beginnings,” moonstone is said to encourage inner growth and strength.", user_id: 2)
  Crystal.create(name: "Bloodstone",purpose: "Bloodstone is claimed to help cleanse the blood by drawing off bad environmental energies and improving circulation.", user_id: 2)
  Crystal.create(name: "Sapphire",purpose: "This blue stone is one of wisdom and royalty. It’s said it can attract prosperity, happiness, and peace while opening up the mind to accept beauty and intuition.", user_id: 3)
  Crystal.create(name: "Ruby",purpose: "A red standout, this stone helps restore vitality and energy levels. This can help improve things such intellect and self awareness.", user_id: 3)
  Crystal.create(name: "Amethyst", purpose: "Aiding sleep and relaxation. Use to: De-stress, purify your aura, and bring divine wisdom.", user_id: 3)
  Crystal.create(name: "Tigers Eye", purpose: "It’s said to help rid your mind and body of fear, anxiety, and self-doubt. This can be beneficial for career aspirations or even matters of the heart. ", user_id: 4)
  Crystal.create(name: "Selenite", purpose: "Selenite is easy to use and connect with and doesn’t need cleansing or recharging.", user_id: 4)
  Crystal.create(name: "Clear Quartz", purpose: "Healing power. Represents: Space, purity and patience.", user_id: 4)
  Crystal.create(name: "Green Aventurine", purpose: "Deep healing.  It is thought to bring new opportunities and good luck. ", user_id: 5)
  Crystal.create(name: "Rose Quartz", purpose: "Love and Divine Feminine energy.The stone of unconditional love, Rose Quartz has been used as a love token since 600 B.C.", user_id: 5)
  Crystal.create(name: "Black Tourmaline", purpose: "Protection. Use to: Cleanse and purify. This semi-precious gemstone rebounds negative energy and reduces anxiety.", user_id: 5)
 



