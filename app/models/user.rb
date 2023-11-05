class User < ApplicationRecord
  has_secure_password
  before_save :normalize_email

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }

  private

  def normalize_email
    self.email = email.strip.downcase
  end

  def self.authenticate_with_credentials(email, password)
    normalized_email = email.strip.downcase
    user = find_by(email: normalized_email)
    return nil unless user

    user.authenticate(password) ? user : nil
  end
end
