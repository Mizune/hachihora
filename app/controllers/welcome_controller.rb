class WelcomeController < ApplicationController
	skip_before_action :check_logined
	before_action :check_welcome_logined
  def index
  end

  private

  def check_welcome_logined
  	if current_user
  		redirect_to new_answer_path
  	end
  end

end
