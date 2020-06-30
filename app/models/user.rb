class User < ApplicationRecord
  has_many :todos
  validates :name,:email,:uid,presence: true
end
