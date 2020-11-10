class User < ActiveRecord::Base
    has_many :flowers
    has_secure_password
    validates_uniqueness_of :email
    validates :name, :email, presence: true 
end