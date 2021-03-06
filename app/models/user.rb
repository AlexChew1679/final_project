class User < ApplicationRecord

  before_save {self.email = email.downcase}

  validates :first_name, presence: true, length: {minimum: 3, maximum: 20}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 20}

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 10, maximun: 50}, format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
