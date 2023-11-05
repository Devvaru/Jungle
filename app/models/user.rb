class User < ApplicationRecord
  has_secure_password
  before_save :normalize_email

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }

  private

  def normalize_email
    self.email = email.downcase
  end
end
