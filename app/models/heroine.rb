class Heroine < ApplicationRecord
	belongs_to :power
	validates :name, :super_name, presence: true, uniqueness: true
end
