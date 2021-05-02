class CreateCrystalsTable < ActiveRecord::Migration[6.1]

  def change
    create_table :crystals do |t|
      t.string :name
      t.string :purpose
      t.integer :user_id
     end
  end
end

