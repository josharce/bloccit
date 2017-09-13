class User < ApplicationRecord
  before_save :capitalize_name, :downcase_email
  
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
  
  has_secure_password
end

private

def capitalize_name
  self.name = name.split.map {|word| word.capitalize}.join(" ") if name.present?
end

def downcase_email
  self.email = email.downcase if email.present?
end
