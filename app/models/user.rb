class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true

  validates :email, presence: true, format: /\A\S+@\S+\z/,
  uniqueness: {case_sensitive: false}

  validates :username, presence: true, length: { minimum: 5 }
end
