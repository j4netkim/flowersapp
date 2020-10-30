class User < ActiveRecord::Base
    has_many :flowers
    has_secure_password
end