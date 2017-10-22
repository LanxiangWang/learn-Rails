class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end
