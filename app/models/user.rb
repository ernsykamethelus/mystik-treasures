class User < ActiveRecord::Base 
    #has_many crystals
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<name>[^@\s]+)@(?<domainname>([-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    # validates :email, presence: true, uniqueness: true 
    has_secure_password
    has_many :crystals
end
