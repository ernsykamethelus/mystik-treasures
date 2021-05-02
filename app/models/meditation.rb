class Meditation < ActiveRecord::Base 
    #a meditation session has many crystals
    belongs_to :crystals
end