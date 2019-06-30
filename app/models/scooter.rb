class Scooter < ApplicationRecord

  def self.active
    Scooter.where(active: true)
  end

  def self.inactive
    Scooter.where(active: false)
  end

end