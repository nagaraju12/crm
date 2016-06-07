class WelcomeController < ApplicationController
  layout :layout?
	before_filter :is_login?

  def index
  end
  
end
