class Book < ApplicationRecord
  #validates :title, presence: true, allow_blank: false
  #validates :body, presence: true, allow_blank: false
  validates :title, presence: true
  validates :body, presence: true
end
