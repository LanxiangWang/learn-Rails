class PagesController < ApplicationController
  def home
    @active = "active"
    
  end

  def about
    @active_about = "active"
  end

  def contact
  end
end
