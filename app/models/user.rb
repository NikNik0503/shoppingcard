class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_secure_password
  
    def self.authenticate(email, password)
        user = User.find_by(email: email)
        user && user.authenticate(password)
    end
end
