module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_default
  end

  def set_default
    @page_title = "Devcamp Portfolio | My Portfolio Website"
  end
end