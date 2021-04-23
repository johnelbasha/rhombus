class Event < ApplicationRecord
  belongs_to :user
  validates :location, presence: true

  def generate_uid
    self.uid = (0...9).map { (65 + rand(26)).chr }.join
  end

end
