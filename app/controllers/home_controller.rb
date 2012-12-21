class HomeController < ApplicationController
  def index
    @current_user = current_user if current_user
  end
end
