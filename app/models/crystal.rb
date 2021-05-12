class Crystal < ActiveRecord::Base 
  belongs_to :user
  validates :name, presence: true
  validates :purpose, presence: true
end
