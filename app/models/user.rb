class User < ActiveRecord::Base
    has_secure_password

    def self.authenticate_with_credentials(email, password)
      strip_email = email.strip.downcase
      user = User.find_by_email(strip_email)
       if user && user.authenticate(password)
        return user
       else
        return nil
       end
  end

    validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  before_save { email.downcase! }

end