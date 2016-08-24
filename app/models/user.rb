class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[a-zA-Z0-9_\.\+-]+@(?:[a-zA-Z0-9_-]+\.){1,}[a-zA-Z0-9_-]{2,5}\z/,
      allow_blank: true
    }
  validates :password, presence: true, length: { minimum: 6, allow_blank: true }, confirmation: true
  validates :first_name, presence: true, length: { minimum: 2, allow_blank: true }
  validates :last_name, presence: true, length: { minimum: 2, allow_blank: true }
end