class Task < ApplicationRecord
  attribute :content, :text

  belongs_to :user
end
