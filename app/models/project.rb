class Project < ActiveRecord::Base
  has_many :ticets
  validates :title, presence: true, length: { minimum: 5 }
end
