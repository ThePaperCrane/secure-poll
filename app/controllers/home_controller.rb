class HomeController < ApplicationController
  def index
    if current_user != nil
      @current_user = current_user
      @keypair = Rsakey.find_by_userid(@current_user.id)
    end
  end
end
