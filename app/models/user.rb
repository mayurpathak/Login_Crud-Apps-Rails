class User < ActiveRecord::Base
has_many :articles, dependent: :destroy
before_save { self.email = email.downcase }
attr_accessor :password_confirmation
# attr_accessible :username
# attr_protected :password
VALID_USERNAME_REGEX = /\^[A-Z]+\$/i
 validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 },
 format: { with: VALID_USERNAME_REGEX }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false },
 format: { with: VALID_EMAIL_REGEX }
 has_secure_password
 validates_confirmation_of :password 

 def self.search(search)
   if search
     where("username like ?", "%#{search}%")
   else
     find(:all)
   end
 end

 def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
end
# This generates a random password reset token for the user
def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

end
