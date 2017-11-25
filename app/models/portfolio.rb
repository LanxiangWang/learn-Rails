class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |x| x['name'].blank?}


  include Placeholder
  validates :title, :body, :main_image, :thumb_image, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator('600', '250')
    self.thumb_image ||= Placeholder.image_generator('250', '250')
  end

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end

end
