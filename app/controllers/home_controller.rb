class HomeController < ApplicationController
  def index
    @users_states = User.group(params["key"].to_sym).count rescue User.group(:phone_number).count
    respond_to do |format|
      format.html 
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end
end
