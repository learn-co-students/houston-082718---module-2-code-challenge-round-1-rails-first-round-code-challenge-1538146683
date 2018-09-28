class Power < ApplicationRecord
  has_many :heroines

  def display_name
    self.name.titleize
  end
end
