class Skill < ApplicationRecord
  include Placeholder
  validates :title, :percent_utilized, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image_generator(250, 250)
  end
end
