class Ticket < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :project
end
