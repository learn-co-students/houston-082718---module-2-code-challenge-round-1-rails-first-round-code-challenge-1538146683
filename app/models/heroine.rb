class Heroine < ApplicationRecord
    belongs_to :power

    validates :name, length: { minimum: 2 }
    validates :super_name, length: { minimum: 2 }
    validates :super_name, uniqueness: true
    validates :name, uniqueness: true

end
