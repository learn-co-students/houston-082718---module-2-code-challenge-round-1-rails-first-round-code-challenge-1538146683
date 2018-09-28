class Heroine < ApplicationRecord
	validates :name, presence: true
	validates :super_name, presence: true
	validates :super_name, uniqueness: true
  
  belongs_to :power
end
