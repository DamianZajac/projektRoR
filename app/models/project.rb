class Project < ActiveRecord::Base
  has_many :tickets
  validates :title, presence: true, length: { minimum: 5 }
end
