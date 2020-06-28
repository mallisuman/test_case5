class WelcomeController < ApplicationController
  def index
    if current_user
    	return redirect_to '/users/dash_board'
    end	
  end
end
