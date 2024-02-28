class Task < ApplicationRecord
  attribute :content, :text

  belongs_to :user
  has_many :likes, dependent: :destroy
end
