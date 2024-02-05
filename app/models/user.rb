class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:2, maxmum:32}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, format: {with: /^[a-zA-Z0-9.?]{8,24}$/, multiline: true}
end

