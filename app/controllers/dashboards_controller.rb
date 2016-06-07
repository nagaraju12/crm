class DashboardsController < ApplicationController
	layout :layout?
	before_filter :is_login?
  def index
  end
  def week
    respond_format
  end
end
